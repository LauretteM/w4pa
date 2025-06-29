import json
from yaml import load, dump
import os.path
import pgf
import pywikibot
from pywikibot import pagegenerators as pg
import itertools
import sys
from tqdm import tqdm

try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper

CAPITAL_CITIES_QUERY_FILE = '../data/queries/capital_cities.auto.rq'
COUNTRIES_QUERY_FILE = "../data/queries/countries.auto.rq"
LANGUAGES_QUERY_FILE = "../data/queries/languages.auto.rq"
CURRENCIES_QUERY_FILE = "../data/queries/currencies.auto.rq"

WIKIDATA_SITE = pywikibot.Site("wikidata", "wikidata")
QUERY_LENGTH_LIMIT = 500

WARNINGS = []
warning_msg = None

lang_code_aliases = [
    {
        "iso-2": "en",
        "iso-3": "eng",
        "gf": "Eng"
    },
    {
        "iso-2": "zu",
        "iso-3": "zul",
        "gf": "Zul"
    }
]

def warning_msg_live(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

def warning_msg_later(*args):
    WARNINGS.append(args)

def build_bantu_number(number : int):
    num_str = str(number)
    if number < 5:
        return f'(SymbModA (SymbNumb (MkSymb "{num_str}")))'
    if number < 10:
        return f'(SymbModSmallN (SymbNumb (MkSymb "{num_str}")))'
    if number < 20:
        return f'(SymbModN10Sg (SymbNumb (MkSymb "{num_str}")))'
    if number < 100:
        return f'(SymbModN10Pl (SymbNumb (MkSymb "{num_str}")))'
    if number < 200:
        return f'(SymbModN100Sg (SymbNumb (MkSymb "{num_str}")))'
    if number < 1000:
        return f'(SymbModN100Pl (SymbNumb (MkSymb "{num_str}")))'
    if number < 2000:
        return f'(SymbModN100Sg (SymbNumb (MkSymb "{num_str}")))'
    else:
        return f'(SymbModN100Pl (SymbNumb (MkSymb "{num_str}")))'


def get_function_name_of_entity(entity_id, pgf_grammar):
    prefix = f"{entity_id}_"
    # warning_msg(f"Looking for {entity_id}")
    try:
        funs = [f for f in pgf_grammar.functions if f.startswith(prefix)]
        fun = funs[0]
    except IndexError:
        return None
    return fun

def find_code(lang_code,code_type):
    for lang in lang_code_aliases:
        for k in lang:
            if lang[k] == lang_code:
                return lang[code_type]

def find_iso_2_code(lang_code):
    return find_code(lang_code,"iso-2")

def find_gf_code(lang_code):
    return find_code(lang_code,"gf")

def find_iso_3_code(lang_code):
    return find_code(lang_code,"iso-3")

def get_capital_city_tree_str(city_id,city_dict, pgf_grammar):

    claims_dict = city_dict['claims']
    country_claims = claims_dict['P17']

    for country_claim in country_claims:
        qualifiers = country_claim.qualifiers
        if not 'P582' in qualifiers.keys(): # if the country claim has no end date
            break
    country_tgt = country_claim.getTarget()
    if country_tgt:
        country_id = country_tgt.getID()
    else:
        return
    if city_id == country_id:
        return # city state, will deal with this as a country
    country_fun = get_function_name_of_entity(country_id,pgf_grammar)

    instance_of_claims = claims_dict["P31"]
    for instance_of_claim in instance_of_claims:
        clm_target = instance_of_claim.getTarget()
        if clm_target.getID() == 'Q51929311': # largest city
            tree_str = f"CityFeatureDescription LargestCity {country_fun}"
        else:
            tree_str = f"CityDescription {country_fun}"

    if not country_fun:
        return

    return tree_str

def get_country_tree_str(country_id,country_dict, pgf_grammar):

    claims_dict = country_dict["claims"]
    region_fun = None
    instance_fun = None

    try:
        in_on_physical_feature_claims = claims_dict['P706']
        for claim in in_on_physical_feature_claims:
            claim_tgt = claim.getTarget()
            tgt_id = claim_tgt.getID()
            region_fun = get_function_name_of_entity(tgt_id, pgf_grammar)
    except KeyError:
        pass

    if not region_fun:
        try:
            continent_claims = claims_dict["P30"]
            for claim in continent_claims:
                claim_tgt = claim.getTarget()
                tgt_id = claim_tgt.getID()
                region_fun = get_function_name_of_entity(tgt_id, pgf_grammar)
        except KeyError:
            pass

    if not region_fun:
        try:
            part_of_claims = claims_dict["P361"]
            for part_of_claim in part_of_claims:
                part_of_tgt = part_of_claim.getTarget() # target is the thing the country is part of
                tgt_id = part_of_tgt.getID()
                tgt_dict = part_of_tgt.get()
                tgt_claims = tgt_dict["claims"]
                tgt_instance_of_claims = tgt_claims["P31"]
                for tgt_instance_of_claim in tgt_instance_of_claims:
                    tgt_instance_of_entity = (
                        tgt_instance_of_claim.getTarget()
                    )  # target is the kind of the thing
                    tgt_instance_of_entity_id = tgt_instance_of_entity.getID()
                    if tgt_instance_of_entity_id == "Q82794" or tgt_instance_of_entity_id == "Q5107":  # we have a geographic region the country is part of
                        region_fun = get_function_name_of_entity(tgt_id, pgf_grammar)
        except KeyError:
            pass

    try:
        instance_of_claims = claims_dict["P31"]
        clm_target_ids = [clm_tgt.getTarget().getID() for clm_tgt in instance_of_claims]

        if "Q112099" in clm_target_ids:
            instance_fun = "IslandCountry"
        elif "Q123480" in clm_target_ids:
            instance_fun = "LandlockedCountry"
        elif "Q11396118" in clm_target_ids:
            instance_fun = "DividedTerritory"

    except KeyError:
        pass

    if region_fun and instance_fun:
        tree_str = f"FullCountryDescription {instance_fun} {region_fun}"
    elif region_fun:
        tree_str = f"CountryRegionDescription {region_fun}"
    elif instance_fun:
        tree_str = f"CountryKindDescription {instance_fun}"
    else:
        tree_str = None

    return tree_str

def get_language_tree_str(lang_id, lang_dict, pgf_grammar):

    claims_dict = lang_dict["claims"]
    langfeature_fun = None

    try:
        country_claims = claims_dict["P17"]
        countries = [clm_tgt.getTarget() for clm_tgt in country_claims]
    except KeyError:
        countries = None

    official_language_countries = []
    spoken_countries = []

    if countries:
        for c in countries:
            c_dict = c.get()
            c_id = c.getID()
            country_fun = get_function_name_of_entity(c_id, pgf_grammar)
            spoken_countries.append(country_fun)
            c_claims = c_dict["claims"]
            try:
                official_language_claims = c_claims["P37"]
                all_official_languages_ids = [
                    clm_tgt.getTarget().getID()
                    for clm_tgt in official_language_claims
                    if clm_tgt.getTarget()
                ]
                this_official_language_ids = [c for c in all_official_languages_ids if c == lang_id
                ]
                if len(this_official_language_ids) > 0:
                    official_language_countries.append((country_fun,len(all_official_languages_ids)))
            except KeyError:
                pass

    number_of_speakers = 0
    try:
        speakers_claims = claims_dict["P1098"]
        for claim in speakers_claims:
            claim_tgt = claim.getTarget()
            number_of_speakers = claim_tgt.amount
    except KeyError:
        pass

    number_fun_speakers = build_bantu_number(number_of_speakers)

    if len(official_language_countries) == 1:
        official_country_fun,number_of_official_langs = official_language_countries[0]
        if len(spoken_countries) > 1:
            number_spoken_countries = len(spoken_countries)
            number_fun = build_bantu_number(number_spoken_countries)
            if number_of_official_langs == 1:
                langfeature_fun = f"SpokenCountriesAndTheOfficial {official_country_fun} {number_fun}"
            else:
                langfeature_fun = f"SpokenCountriesAndTheOfficial {official_country_fun} {number_fun}"
        else:
            langfeature_fun = f"OfficialLanguage {official_country_fun}"
    elif len(official_language_countries) == 0:
        if len(spoken_countries) == 1:
            spoken_country = spoken_countries[0]
            langfeature_fun = f"SpokenInCountry {spoken_country}"
        elif len(spoken_countries) == 2:
            spoken_country_1 = spoken_countries[0]
            spoken_country_2 = spoken_countries[1]
            langfeature_fun = (
                f"SpokenInTwoCountries {spoken_country_1} {spoken_country_2}"
            )
        elif len(spoken_countries) > 2:
            number_spoken_countries = len(spoken_countries)
            number_fun_countries = build_bantu_number(number_spoken_countries)
            number_fun_speakers = build_bantu_number(number_of_speakers)
            if number_of_speakers > 0:
                langfeature_fun = f"SpokenCountriesNumberOfSpeakers {number_fun_speakers} {number_fun_countries}"
            else:
                langfeature_fun = f"SpokenCountriesNumber {number_fun_countries}"
    elif number_of_speakers > 0:
        langfeature_fun = f"NumberOfSpeakers {number_fun_speakers}"

    if langfeature_fun:
        tree_str = f"LanguageFeatureDescription ({langfeature_fun})"
        return tree_str

def get_currency_tree_str(currency_id, currency_dict, pgf_grammar):
    
    claims_dict = currency_dict["claims"]

    try:
        country_claims = claims_dict["P17"]
        countries = [clm_tgt.getTarget() for clm_tgt in country_claims]
    except KeyError:
        countries = None
    currency_feature_fun = None
    
    if countries and len(countries) == 1:
        c = countries[0]
        c_dict = c.get()
        c_id = c.getID()
        country_fun = get_function_name_of_entity(c_id, pgf_grammar)
        
        currency_feature_fun = f'(OfficialCurrency {country_fun})'
    else:
        try:
            issuer_claims = claims_dict["P562"]
            num = len(issuer_claims)
            warning_msg(f"Number of issuers {num}")
            issuers = [clm_tgt.getTarget() for clm_tgt in issuer_claims]
            issuer = issuers[0]
            iss_id = issuer.getID()
            issuer_fun = get_function_name_of_entity(iss_id, pgf_grammar)

            currency_feature_fun = f'(CentralBankFeature {issuer_fun})'
        except KeyError:
            issuers = None
        
    if not currency_feature_fun:
        currency_feature_fun = 'FAILED_CURRENCY_FEATURE'

    tree_str = f'CurrencyFeatureDescription ({currency_feature_fun})'
    return tree_str

def generate_descriptions(lang_code, pgf_grammar, query_filename, tree_str_fun, key_suffix, test_mode=None):

    lang_code = find_iso_2_code(lang_code)

    if not test_mode:
        entities = get_entities(query_filename)
    else:
        entities = get_test_entities(test_mode)

    descriptions = {}

    if not entities:
        return

    for i in tqdm(range(len(entities)), desc="Analysing Wikidata..."):
        try:

            entity = entities[i]

            entity_dict = entity.get()
            
            entity_id = entity.getID()
            entity_fun = get_function_name_of_entity(entity_id,pgf_grammar)

            tree_str = tree_str_fun(entity_id,entity_dict, pgf_grammar)

            if not entity_fun or not tree_str:
                
                warning_msg(f"Not generating a description for {entity_id}")
                warning_msg(entity_fun)
                continue

            tree = pgf.readExpr(tree_str)
            conc_name = pgf_grammar.abstractName+find_gf_code(lang_code)
            conc = pgf_grammar.languages[conc_name]

            try:
                entity_label = entity_dict["labels"][lang_code]
                warning_msg(f"using existing name for {entity_fun}: {entity_label}")
            except KeyError:
                entity_label = None
            new_label = conc.linearize(pgf.readExpr(entity_fun))

            try:
                entity_descr = entity_dict["descriptions"][lang_code]
                warning_msg(f"using existing description for {entity_fun}: {entity_descr}")
            except KeyError:
                entity_descr = None
            new_descr = conc.linearize(tree)

            entity_data_dict = {
                "labels": {},
                "descriptions": {},
                "wd_id": entity_id,
                "gf_id": entity_fun,
                "description_tree": tree_str
            }
            eng_label = entity_dict["labels"]['en']
            entity_data_dict["labels"]['eng'] = eng_label

            entity_data_dict["labels"][find_iso_3_code(lang_code)+"_old"] = entity_label
            entity_data_dict["descriptions"][find_iso_3_code(lang_code)+"_old"] = entity_descr

            entity_data_dict["labels"][find_iso_3_code(lang_code)+"_new"] = new_label
            entity_data_dict["descriptions"][find_iso_3_code(lang_code)+"_new"] = new_descr

            entity_key = f"{entity_fun}_{key_suffix}"

            descriptions[entity_key] = entity_data_dict
        
        except AttributeError: # whatever goes wrong, just don't break
            warning_msg(f"Skipping entity number {i}")

    return descriptions


def generate_capital_city_descriptions(lang_code, pgf_grammar, test_mode):

    query_filename = CAPITAL_CITIES_QUERY_FILE
    tree_str_fun = get_capital_city_tree_str
    key_suffix = "CapitalCity"

    return generate_descriptions(
        lang_code, pgf_grammar, query_filename, tree_str_fun, key_suffix, test_mode
    )


def generate_country_descriptions(lang_code, pgf_grammar, test_mode):

    query_filename = COUNTRIES_QUERY_FILE
    tree_str_fun = get_country_tree_str
    key_suffix = "Country"

    return generate_descriptions(
        lang_code, pgf_grammar, query_filename, tree_str_fun, key_suffix, test_mode
    )


def generate_language_descriptions(lang_code, pgf_grammar, test_mode):

    query_filename = LANGUAGES_QUERY_FILE
    tree_str_fun = get_language_tree_str
    key_suffix = "Language"

    return generate_descriptions(
        lang_code, pgf_grammar, query_filename, tree_str_fun, key_suffix, test_mode
    )

def generate_currency_descriptions(lang_code, pgf_grammar, test_mode):

    query_filename = CURRENCIES_QUERY_FILE
    tree_str_fun = get_currency_tree_str
    key_suffix = "Currency"

    return generate_descriptions(
        lang_code, pgf_grammar, query_filename, tree_str_fun, key_suffix, test_mode
    )


def get_entities(query_filename):
    # get all entities
    with open(query_filename) as query_file:
        QUERY = query_file.read()
    generator = pg.WikidataSPARQLPageGenerator(QUERY, site=WIKIDATA_SITE)

    try:
        entities = list(itertools.islice(generator, QUERY_LENGTH_LIMIT))
    except TypeError as e:
        warning_msg(f"Could not retrieve entities using {query_filename}")
        return

    return entities

def get_test_entities(filename):
    with open(filename) as f:
        fun_names = [l.strip() for l in f.readlines()]
    
    entity_ids = [f[:f.index('_')] for f in fun_names]

    repo = WIKIDATA_SITE.data_repository()

    entities = []
    for i in entity_ids:
        item = pywikibot.ItemPage(repo, i)
        entities.append(item)
    
    return entities

def update_yaml(yaml_filename,descriptions):
    if descriptions:
        if yaml_filename:
            try:
                with open(yaml_filename) as f:
                    base_data = load(f,Loader=Loader)
            except FileNotFoundError:
                    warning_msg(f"File not found: {yaml_filename}. Creating new file.")
                    base_data = {}

            for key in descriptions:
                if key in base_data:
                    base_data[key].update(descriptions[key])
                else:
                    base_data[key] = descriptions[key]
                yaml = dump(base_data, Dumper=Dumper)

            with open(yaml_filename, "w") as f:
                f.write(yaml)
        else:
            yaml = dump(descriptions, Dumper=Dumper)
            print(yaml)
    else:
        warning_msg(f"Cannot write descriptions.")
    


if __name__ == '__main__':

    import argparse

    parser = argparse.ArgumentParser(description='generate descriptions from Wikidata')
    parser.add_argument("param_config",help="name of json file containing parameters of generation task")
    parser.add_argument('-a',dest="amend_yaml_file",help="name of (possibly empty) yaml file to amend")
    parser.add_argument('-t',dest='test_mode_input',default=None,help='')
    parser.add_argument('-w',dest='supress_warnings',action='store_true',help='suppress warnings until execution is done')
    args = parser.parse_args()

    if args.supress_warnings:
        warning_msg = warning_msg_later
    else:
        warning_msg = warning_msg_live

    with open(args.param_config) as f:
        params = json.loads(f.read())

    lang_code = params["language_code"]

    pgf_grammar = pgf.readPGF(os.path.join("..","grammar",params["pgf_grammar"]))

    if "capital_cities" in params['entity_types']:
        city_descriptions = generate_capital_city_descriptions(lang_code, pgf_grammar,args.test_mode_input)
        update_yaml(args.amend_yaml_file,city_descriptions)

    if "countries" in params['entity_types']:
        country_descriptions = generate_country_descriptions(
            lang_code, pgf_grammar, args.test_mode_input
        )
        update_yaml(args.amend_yaml_file,country_descriptions)

    if "languages" in params["entity_types"]:
        language_descriptions = generate_language_descriptions(
            lang_code, pgf_grammar, args.test_mode_input
        )
        update_yaml(args.amend_yaml_file,language_descriptions)

    if "currencies" in params["entity_types"]:
        currency_descriptions = generate_currency_descriptions(
            lang_code, pgf_grammar, args.test_mode_input
        )
        update_yaml(args.amend_yaml_file,currency_descriptions)

    if args.supress_warnings:
        for a in WARNINGS:
            print(*a, file=sys.stderr)

    
