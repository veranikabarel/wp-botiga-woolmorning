#Convert-Import-File.ps1
This script converts Shopper-style images in products file into format that can be imported into Woo-commerce.
Usage example:
1. Open Power Shell
2. Run the following command:
`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`
3. Run the script. The first argument is path to input file, second is path to target output file, both are optional:
`.\Convert-Import-File.ps1 .\products_test.csv .\products_test_fixed_images.csv`