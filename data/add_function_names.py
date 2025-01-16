import csv
from unidecode import unidecode

def get_function_name(entity_name):
    fun_name = unidecode(entity_name)
    fun_name = fun_name.replace("'", "") \
        .replace(" ", "_") \
        .replace("`",'') \
        .replace('-','_') \
        .replace('.','') \
        .replace(',','')
    return fun_name

if __name__ == '__main__':

    import argparse

    parser = argparse.ArgumentParser(description='add function names to data obtained from query with column for entity and name')

    parser.add_argument('input',help='csv file obtained by querying Wikidata')
    parser.add_argument('-o','--output',dest='output', help='name of output csv file')

    args = parser.parse_args()

    with open(args.input) as f:
        rdr = csv.reader(f)
        datarows = [r for r in rdr]

    newheading = [datarows[0][0],datarows[0][1],'function name']
    # newrows = [(qid,entity_name,get_function_name(entity_name)) for (qid,entity_name) in datarows[1:]]
    newrows = [(r[0], r[1], get_function_name(r[1])) for r in datarows[1:]]

    if args.output:
        with open(args.output,'w') as f:
            wrtr = csv.writer(f)
            wrtr.writerow(newheading)
            wrtr.writerows(newrows)
    else:
        print(newheading)
        for l in newrows:
            print(l)
