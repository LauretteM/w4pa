import pandas as pd
print("Script is running...")

def read_csv(input_test):
    try:
        df = pd.read_csv(input_test)
        print(f"\nCSV read successfully! Number of rows: {df.shape[0]}, Number of columns: {df.shape[1]}")
        print(f"Column titles : {list(df.columns)}")
        return df
    except Exception as e:
        print(f"\nCannot read CSV: {e}")
        return None

def add_new_columns(df, required_columns):
    new_columns = [col for col in required_columns if col not in df.columns]
    for col in new_columns:
        df[col] = ""
    
    if new_columns:
        print(f"\nNew columns added: {new_columns}")
    else:
        print("\nNo new columns added.")
    
    return df

def write_csv(df, output_test, required_columns):
    try:
        df = df[required_columns]
        df.to_csv(output_test, index=False)
        print(f"\nNew CSV created: {output_test}")
    except Exception as e:
        print(f"\nNo new CSV created: {e}")

def expand_csv(input_test, output_test):
    required_columns = [
        "area", "entity id", "areaLabel_en", "function name",
        "abstract line", "eng concrete line", "eng lexicon line"
    ]
    
    df = read_csv(input_test)
    if df is not None:
        df = add_new_columns(df, required_columns)
        write_csv(df, output_test, required_columns)

if __name__ == "__main__":
    input_test = r"C:\Users\RonéWierenga\Wikidata\w4pa\data\test_input.csv"
    output_test = r"C:\Users\RonéWierenga\Wikidata\w4pa\data\test_output.csv"
    
    expand_csv(input_test, output_test)
