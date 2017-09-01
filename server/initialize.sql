
DROP TABLE IF EXISTS edge_arrays;

CREATE TABLE edge_arrays
 (
   node_number text NOT NULL,
   edges text[] NOT NULL,
   CONSTRAINT edges PRIMARY KEY (node_number)
 );

COPY citation_arrays from '/path/to/data/psqlData.csv' DELIMITER ',' CSV;

CREATE INDEX idx_gin_edges ON edge_arrays USING GIN (edges);

