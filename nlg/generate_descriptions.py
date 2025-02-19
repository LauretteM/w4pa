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

WIKIDATA_SITE = pywikibot.Site("wikidata", "wikidata")
QUERY_LENGTH_LIMIT = 500

lang_code_aliases = [
    {
        "iso-2": "en",
        "iso-3": "eng",
        "gf": "Eng"
    }
]

def warning_msg(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


def get_function_name_of_entity(entity_id, pgf_grammar):
    prefix = f"{entity_id}_"
    try:
        fun = [f for f in pgf_grammar.functions if f.startswith(prefix)][0]
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

def generate_capital_city_descriptions(lang_code, pgf_grammar):

    lang_code = find_iso_2_code(lang_code)

    # get all capital city entities
    with open(CAPITAL_CITIES_QUERY_FILE) as query_file:
        QUERY = query_file.read()
    generator = pg.WikidataSPARQLPageGenerator(QUERY, site=WIKIDATA_SITE)

    cities = list(itertools.islice(generator, QUERY_LENGTH_LIMIT))
    descriptions = {}

    for i in tqdm(range (len(cities)), desc="Analysing Wikidata..."):

        city = cities[i]

        city_dict = city.get()
        city_name = city_dict["labels"][lang_code]
        city_id = city.getID()
        city_fun = get_function_name_of_entity(city_id,pgf_grammar)

        claims_dict = city_dict['claims']
        country_claims = claims_dict['P17']

        for country_claim in country_claims:
            qualifiers = country_claim.qualifiers
            if not 'P582' in qualifiers.keys():
                break
        country_trgt = country_claim.getTarget()
        country_id = country_trgt.getID()
        country_fun = get_function_name_of_entity(country_id,pgf_grammar)

        instance_of_claims = claims_dict["P31"]
        for instance_of_claim in instance_of_claims:
            clm_target = instance_of_claim.getTarget()
            if clm_target.getID() == 'Q133442': # city-state
                tree_str = None # will deal with this as a country
            elif clm_target.getID() == 'Q51929311': # largest city
                tree_str = f"CityFeatureDescription LargestCity {country_fun}"
            else:
                tree_str = f"CityDescription {country_fun}"

        if not city_fun or not country_fun or not tree_str:
            warning_msg(f"Not generating a description for {city_name}")
            continue

        tree = pgf.readExpr(tree_str)
        conc_name = pgf_grammar.abstractName+find_gf_code(lang_code)
        conc = pgf_grammar.languages[conc_name]
        conc_lin = conc.linearize(tree)

        city_data_dict = {
            "labels": {},
            "descriptions": {},
            "wd_id": city_id,
            "gf_id": city_fun,
            "description_tree": tree_str
        }
        city_data_dict["labels"][find_iso_3_code(lang_code)] = city_name
        city_data_dict["descriptions"][find_iso_3_code(lang_code)] = conc_lin

        city_key = f"{city_fun}_CapitalCity"

        descriptions[city_key] = city_data_dict

    return descriptions


if __name__ == '__main__':

    import argparse

    parser = argparse.ArgumentParser(description='generate descriptions from Wikidata')
    parser.add_argument("param_config",help="name of json file containing parameters of generation task")
    parser.add_argument('-a',dest="amend_yaml_file",help="name of (possibly empty) yaml file to amend")
    args = parser.parse_args()

    with open(args.param_config) as f:
        params = json.loads(f.read())

    lang_code = params["language_code"]

    pgf_grammar = pgf.readPGF(os.path.join("..","grammar",params["pgf_grammar"]))

    if "capital_cities" in params['entity_types']:
        descriptions = generate_capital_city_descriptions(lang_code, pgf_grammar)

    if args.amend_yaml_file:

        with open(args.amend_yaml_file) as f:
            base_data = load(f,Loader=Loader)
            if not base_data:
                base_data = {}

        for key in descriptions:
            if key in base_data:
                base_data[key]["description_tree"] = descriptions[key]["description_tree"]
                base_data[key]["gf_id"] = descriptions[key]["gf_id"]
                base_data[key]["wd_id"] = descriptions[key]["wd_id"]
                base_data[key]["labels"][find_iso_3_code(lang_code)] \
                    = descriptions[key]["labels"][find_iso_3_code(lang_code)]
                base_data[key]["descriptions"][find_iso_3_code(lang_code)] = (
                    descriptions[key]["descriptions"][find_iso_3_code(lang_code)]
                )
            else:
                base_data[key] = descriptions[key]
            yaml = dump(base_data, Dumper=Dumper)

        with open(args.amend_yaml_file, "w") as f:
            f.write(yaml)
    else:
        yaml = dump(descriptions, Dumper=Dumper)
        print(yaml)
