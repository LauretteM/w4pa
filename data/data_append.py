import csv
import argparse

def prepare_abs_line(eng_label, category_name):
    """Format the third column entry to remove spaces and append ': category_name'."""
    return eng_label.replace(" ", "_") + f" : {category_name} ;"

def prepare_eng_line(function_name):
    """Format the third column entry as 'eng = mkNP eng_N ;'"""
    oper_name = function_name[function_name.index("_")+1:]
    return f"{function_name} = mkNP {oper_name}_N ;"

def prepare_lex_line(eng_label, function_name):
    """Format the third column entry as 'eng_N : N = mkN "eng" ;'"""
    oper_name = function_name[function_name.index("_") + 1 :]
    return f'{oper_name}_N : N = mkN "{eng_label}" ;'

def read_csv(input_file):
    """Read the CSV file into a list of dictionaries."""
    try:
        with open(input_file, newline='', encoding='utf-8') as f:
            reader = csv.reader(f)
            data = [row for row in reader]
            print(data[0])
        if not data:
            print("\nError: The CSV file is empty.")
            return None
        print(f"\nCSV read successfully! Number of rows: {len(data)}")
        # print(f"Column titles: {list(data[0].keys())}")
        return data
    except csv.Error as e:
        print(f"\nCannot read CSV: {e}")
        return None

def process_data(data, category_name):
    new_data = []
    for row in data:
        new_row = row
        new_row.append(prepare_abs_line(row[3], category_name))
        new_row.append(prepare_eng_line(row[3]))
        new_row.append(prepare_lex_line(row[2],row[3]))
        new_data.append(new_row)
    return new_data

def write_csv(data, headings, output_file):
    try:
        fieldnames = headings + ["abstract line", "eng concrete line", "eng lexicon line"]
        with open(output_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(fieldnames)
            writer.writerows(data)
        print(f"\nNew CSV created: {output_file}")
    except Exception as e:
        print(f"\nNo new CSV created: {e}")

def expand_csv(input_file, output_file, category_name):
    data = read_csv(input_file)
    headings = data[0]
    if data:
        data = process_data(data[1:], category_name)
        write_csv(data, headings, output_file)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Expand a CSV file by adding missing columns and processing data.")
    parser.add_argument("input", help="Path to the input CSV file")
    parser.add_argument("output", help="Path to save the processed CSV file")
    parser.add_argument("category_name", help="the category name of entities")
    args = parser.parse_args()
    
    expand_csv(args.input, args.output, args.category_name)

    # data input expected: url, entity id, eng label, function name
    # data output appended: abstract line, eng concrete line, eng lexicon line
