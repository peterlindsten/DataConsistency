# POC for data consistency checks with U-SQL #
The scripts assume Postgres 9.6 (should work with earlier and later) as the
source.

## General ##
This is a POC to show how row-by-row data consistency checks can be done with U-SQL.

## Files ##
- `Create-load.sql` makes the table and a couple of dummy rows, sets up a view 
with checksum column, exports to a CSV file with all values quoted.
- `hashview.csv` an example of an exported file
- `validate.usql` imports c# crypto hash libarary, extracts rows from a hashview.csv, computes the checksum again, outputs to another csv
- `output.csv` an example of an output file. Hashes are manually compared for now

## Notes ##
CRC Checksums need an external C# lib, or bring your own (probably easiest).