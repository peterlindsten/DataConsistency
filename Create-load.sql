-- Postgresql is assumed, tested on version 9.6


-- Basic table with some data
DROP TABLE IF EXISTS dataTable;

CREATE TABLE dataTable (
    id int,
    vchar varchar(20),
    chr char(1),
    ver int,
    current char(1),
    CONSTRAINT pkey PRIMARY KEY (id, ver)
);

INSERT INTO dataTable (id, vchar, chr, ver, current)
VALUES
(1, 'rawr', 'a', 1, 'N'),
(1, 'rawr', 'b', 2, 'Y');

-- View with virtual checksum column
CREATE OR REPLACE VIEW hashview AS
    SELECT *, md5(concat(id, vchar, chr, ver, current)) as checksum
    FROM "datatable";

-- Replace with your local usql-root, or upload csv file to Data Lake Store
COPY (SELECT * FROM hashview) TO 'c:/local/path/hashview.csv' DELIMITER ',' FORCE_QUOTE *;
