
https://neo4j.com/docs/operations-manual/current/installation/docker/

```
docker run --rm -d \
--publish=7474:7474 --publish=7687:7687 \
--volume=$HOME/neo4j/data:/data \
neo4j
```

```
# docker exec -it $(docker ps -q -f ancestor=neo4j) bin/cypher-shell
username: neo4j
password: ********
Connected to Neo4j 3.3.3 at bolt://localhost:7687 as user neo4j.
Type :help for a list of available commands or :exit to exit the shell.
Note that Cypher queries must end with a semicolon.
neo4j> CREATE (matrix:Movie { title:"The Matrix",released:1997 })
       CREATE (cloudAtlas:Movie { title:"Cloud Atlas",released:2012 })
       CREATE (forrestGump:Movie { title:"Forrest Gump",released:1994 })
       CREATE (keanu:Person { name:"Keanu Reeves", born:1964 })
       CREATE (robert:Person { name:"Robert Zemeckis", born:1951 })
       CREATE (tom:Person { name:"Tom Hanks", born:1956 })
       CREATE (tom)-[:ACTED_IN { roles: ["Forrest"]}]->(forrestGump)
       CREATE (tom)-[:ACTED_IN { roles: ['Zachry']}]->(cloudAtlas)
       CREATE (robert)-[:DIRECTED]->(forrestGump);
0 rows available after 556 ms, consumed after another 0 ms
Added 6 nodes, Created 3 relationships, Set 14 properties, Added 6 labels
neo4j> MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
       RETURN a,count(*) AS appearances
       ORDER BY appearances DESC LIMIT 10;
+---------------------------------------------------------+
| a                                         | appearances |
+---------------------------------------------------------+
| (:Person {born: 1956, name: "Tom Hanks"}) | 2           |
+---------------------------------------------------------+

1 row available after 11 ms, consumed after another 0 ms
neo4j> MATCH (m:Movie)<-[:ACTED_IN]-(a:Person)
       RETURN m.title AS movie, collect(a.name) AS cast, count(*) AS actors;
+-----------------------------------------+
| movie          | cast          | actors |
+-----------------------------------------+
| "Forrest Gump" | ["Tom Hanks"] | 1      |
| "Cloud Atlas"  | ["Tom Hanks"] | 1      |
+-----------------------------------------+

2 rows available after 61 ms, consumed after another 7 ms
neo4j> :exit

Bye!
```
