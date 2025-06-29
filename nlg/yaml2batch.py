from yaml import load, dump
try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper

def generate_batch_fragment(entity,lang_code):

    fragment = []
    wikidata_id = entity["wd_id"]

    try:
        old_label = entity["labels"][lang_code+"_old"]
        new_label = entity["labels"][lang_code+"_new"]
        eng_label = entity["labels"]["eng"]
        if new_label and not old_label:
            fragment.append(f'{wikidata_id} L{lang_code} "{new_label}"')
        if old_label == eng_label:
            fragment.append(f'{wikidata_id} L{lang_code} "{new_label}"')
    except KeyError:
        pass

    try:
        old_description = entity["descriptions"][lang_code+"_old"]
        new_description = entity["descriptions"][lang_code+"_new"]
        if new_description and not old_description:
            fragment.append(f'{wikidata_id} D{lang_code} "{new_description}"')
    except KeyError:
        pass
    
    return fragment

if __name__ == '__main__':

    import argparse

    parser = argparse.ArgumentParser(description='convert yaml to batch script format for Wikidata')

    parser.add_argument('input',help='filename of yaml data')
    parser.add_argument('lang_code',help='iso-3 code for language')
    parser.add_argument('output',help='filename of output batch script')

    args = parser.parse_args()

    with open(args.input) as f:
        data = load(f,Loader=Loader)
    
    lines = []
    for d in data:
        d_lines = generate_batch_fragment(data[d],args.lang_code)
        lines += d_lines
    
    with open(args.output,'w') as f:
        f.writelines([f'{l}\n' for l in lines])
    