import csv
import argparse
from unidecode import unidecode

def get_function_name(entity_name):
    fun_name = unidecode(entity_name)
    fun_name = fun_name.replace("'", "") \
        .replace(" ", "_") \
        .replace("`", "") \
        .replace('-', '_') \
        .replace('.', '') \
        .replace(',', '')
    return fun_name

def format_area_label(area_label):
    """Format the third column entry to remove spaces and append ': Country'."""
    return area_label.replace(" ", "") + " : Country"

def format_mkNP(area_label):
    """Format the third column entry as 'Area = mkNP Area_N ;'"""
    area_no_space = area_label.replace(' ', '')
    return f"{area_no_space} = mkNP {area_no_space}_N ;"

def format_abstract(area_label):
    """Format the third column entry as 'Area_N : N = mkN "Area" ;'"""
    area_no_space = area_label.replace(' ', '')
    return f"{area_no_space}_N : N = mkN \"{area_label}\" ;"

def extract_entity_id(area_url):
    """Extract the entity ID from the area URL"""
    return area_url[31:] if len(area_url) > 31 else area_url

def read_csv(input_file):
    """Read the CSV file into a list of dictionaries."""
    try:
        with open(input_file, newline='', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            data = [row for row in reader]
        if not data:
            print("\nError: The CSV file is empty.")
            return None
        print(f"\nCSV read successfully! Number of rows: {len(data)}")
        print(f"Column titles: {list(data[0].keys())}")
        return data
    except Exception as e:
        print(f"\nCannot read CSV: {e}")
        return None

def process_data(data):
    for row in data:
        row["entity id"] = extract_entity_id(row["area"])
        row["function name"] = get_function_name(row["areaLabel_en"])
        row["abstract line"] = format_area_label(row["areaLabel_en"])
        row["eng concrete line"] = format_mkNP(row["areaLabel_en"])
        row["eng lexicon line"] = format_abstract(row["areaLabel_en"])
    return data

def write_csv(data, output_file):
    try:
        fieldnames = ["area", "areaLabel_en", "entity id", "function name", "abstract line", "eng concrete line", "eng lexicon line"]
        with open(output_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            for row in data:
                writer.writerow({field: row.get(field, '') for field in fieldnames})
        print(f"\nNew CSV created: {output_file}")
    except Exception as e:
        print(f"\nNo new CSV created: {e}")

def expand_csv(input_file, output_file):
    data = read_csv(input_file)
    if data:
        data = process_data(data)
        write_csv(data, output_file)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Expand a CSV file by adding missing columns and processing data.")
    parser.add_argument("input", help="Path to the input CSV file")
    parser.add_argument("output", help="Path to save the processed CSV file")
    args = parser.parse_args()
    
    expand_csv(args.input, args.output)
