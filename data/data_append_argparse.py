import csv
import argparse

print("Script is running...")

def read_csv(test_input):
    try:
        with open(test_input, newline='', encoding='utf-8') as f:
            reader = csv.reader(f)
            data = [row for row in reader]
        if not data:
            print("\nError: The CSV file is empty.")
            return None
        print(f"\nCSV read successfully! Number of rows: {len(data) - 1}, Number of columns: {len(data[0])}")
        print(f"Column titles: {data[0]}")
        return data
    except Exception as e:
        print(f"\nCannot read CSV: {e}")
        return None

def add_new_columns(data, required_columns):
    if not data:
        print("\nError: No data found in CSV.")
        return None
    
    existing_columns = data[0]
    new_columns = [col for col in required_columns if col not in existing_columns]
    
    if new_columns:
        print(f"\nNew columns added: {new_columns}")
        existing_columns.extend(new_columns)
        for row in data[1:]:
            row.extend([''] * len(new_columns))
    else:
        print("\nNo new columns added.")
    
    return data

def write_csv(data, test_output2):
    try:
        with open(test_output2, 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerows(data)
        print(f"\nNew CSV created: {test_output2}")
    except Exception as e:
        print(f"\nNo new CSV created: {e}")

def expand_csv(test_input, test_output2):
    required_columns = [
        "area", "entity id", "areaLabel_en", "function name",
        "abstract line", "eng concrete line", "eng lexicon line"
    ]
    
    data = read_csv(test_input)
    if data:
        data = add_new_columns(data, required_columns)
        if data:
            write_csv(data, test_output2)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Expand a CSV file by adding missing columns.")
    parser.add_argument("test_input", help="Path to the input CSV file")
    parser.add_argument("test_output2", help="Path to the output CSV file")
    args = parser.parse_args()
    
    expand_csv(args.test_input, args.test_output2)
