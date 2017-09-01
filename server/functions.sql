
DROP TABLE IF EXISTS distance;
CREATE TABLE distance 
(
  node1 text,
  node2 text,
  intersection_array text[] NOT NULL,
  union_array text[] NOT NULL,
  CONSTRAINT edge_connect PRIMARY KEY (node1, node2)
);

CREATE OR REPLACE FUNCTION distance_counts(text)
  RETURNS void AS
$BODY$
INSERT INTO distance
SELECT
  array1.node_number as node1,
  array2.node_number as node2,
  ARRAY(SELECT unnest(array1.edges) INTERSECT SELECT unnest(array2.edges)) AS intersection_array,
  ARRAY(SELECT unnest(array1.edges) UNION SELECT unnest(array2.edges)) AS union_array
FROM
  edge_arrays array1 JOIN edge_arrays array2
ON
  array1.node_number < array2.node_number
WHERE
  (array1.node_number = $1) AND
  (array1.edges && array2.edges)
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;

CREATE OR REPLACE FUNCTION distance_function(text[])
  RETURNS void AS
$BODY$
<<outerblock>>
DECLARE
  node text;
BEGIN
  FOREACH node IN ARRAY $1
  LOOP
    PERFORM distance_counts(node);
  END LOOP;
  RETURN;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


