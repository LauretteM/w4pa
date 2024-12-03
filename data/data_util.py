def view_missing_labels(yaml_data,lang_code):
    missing_entity_list = []
    for entity_key in yaml_data:
        if not lang_code in yaml_data[entity_key]["labels"].keys():
            missing_entity_list.append(entity_key)
    return missing_entity_list

def view_missing_wd_id(yaml_data):
    missing_entity_list = []
    for entity_key in yaml_data:
        if not "wd_id" in yaml_data[entity_key].keys():
            missing_entity_list.append(entity_key)
    return missing_entity_list

if __name__ == '__main__':

    import sys
    import argparse
    from yaml import load, dump
    try:
        from yaml import CLoader as Loader, CDumper as Dumper
    except ImportError:
        from yaml import Loader, Dumper

    parser = argparse.ArgumentParser(description='utilities for manipulating terminology data')

    subparsers = parser.add_subparsers(help="subcommand help")

    view_missing_parser = subparsers.add_parser("view_missing", help="subcommand for viewing missing labels")
    view_missing_parser.add_argument(
        "data", help="filename of YAML/JSON file (default is YAML)"
    )
    view_missing_parser.add_argument('type',choices=['label','wd_id'])
    view_missing_parser.add_argument('-l',dest='lang_code')

    args = parser.parse_args()

    with open(args.data) as f:
        yaml_data = load(f, Loader=Loader)

    if args.type == "label":
        if not args.lang_code:
            print("Please specify a language code to view missing labels.")
            sys.exit()
        missing = view_missing_labels(yaml_data,args.lang_code)
        for m in missing:
            print(m)
    elif args.type == "wd_id":
        missing = view_missing_wd_id(yaml_data)
        for m in missing:
            print(m)
