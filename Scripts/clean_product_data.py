import pandas as pd

# Load the CSV file
file_path = "../Data_Files/Product_data.csv"  # Replace with your file path
product_data = pd.read_csv(file_path, encoding='latin1')

# Clean the data by removing "$" symbols and converting prices to numeric
product_data_cleaned = product_data.copy()
product_data_cleaned['Cost Price'] = product_data_cleaned['Cost Price'].replace('[\$,]', '', regex=True).astype(float)
product_data_cleaned['Sale Price'] = product_data_cleaned['Sale Price'].replace('[\$,]', '', regex=True).astype(float)

# Save the cleaned data to a new CSV file
cleaned_file_path = "../Cleaned_Data/Product_data_cleaned.csv"  # Replace with your desired file path
product_data_cleaned.to_csv(cleaned_file_path, index=False)

print(f"Cleaned file saved to: {cleaned_file_path}")
