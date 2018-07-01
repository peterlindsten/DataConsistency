# POC for data consistency checks with U-SQL #
The scripts assume Postgres 9.6 (should work with earlier and later) as the source.

## General ##
This is a POC to show how data consistency checks can be done with U-SQL.

## Files ##
- `Create-load.sql` makes the table and a couple of dummy rows, sets up a view 
with checksum column, exports to a CSV file with all values quoted, exports
 another file with the "master" hash (hash of hashes)
- `hashview.csv` an example of an exported file
- `masterhash.csv` an example of a master hash
- `validate.usql` imports c# crypto hash libarary, extracts rows from a
 hashview.csv, computes the checksum again, outputs to another csv. Then
 computes the hash-of-hashes from the extracted data, finally loading the
 masterhash.csv and comparing the hash, outputting `True` if they are the same 
 or `False` if they differ
- `output.csv` an example of an output file. Hashes are manually compared for now
- `masters.csv` an example of a hash-of-hashes comparsion

## Notes ##
CRC Checksums need an external C# lib, or bring your own (probably easiest).