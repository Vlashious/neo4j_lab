// Напаўненне базы дадзенымі
create (g: Game {name: "The Sims 4", year: 2014, genre: "Life simulator"})
create (g: Game {name: "Spore", year: 2008, genre: "Life simulator"})
create (g: Game {name: "League of Legends", year: 2009, genre: "MOBA"})
create (g: Game {name: "Crazy Machines", year: 2005, genre: "Puzzle"})
create (g: Game {name: "Ферма Айрис", year: 2009, genre: "Business"})
create (g: Game {name: "Building & Co", year: 2008, genre: "Building simulator"})
create (g: Game {name: "Алекс Гордон",  year: 2009, genre: "Platformer"})
create (g: Game {name: "Гений обороны", year: 2010, genre: "Defense tower"})
create (g: Game {name: "5 карточных королевств", year: 2009, genre: "Logic"})

create (g: Publisher {name: "Maxis"})
create (g: Publisher {name: "Alawar"})

// Даданне адносін
match (a:Game), (b:Publisher) where a.name="Spore" and b.name="Maxis" create (a)-[r:PUBLISHED_BY]->(b)
match (a:Game), (b:Publisher) where a.name="The Sims 4" and b.name="Maxis" create (a)-[r:PUBLISHED_BY]->(b)
match (a:Game), (b:Publisher) where (a.name <> "The Sims 4" and a.name <> "Spore") and b.name = "Alawar" create (a)-[r:PUBLISHED_BY]->(b)

// Запыты
// 1. Знайсці ўсе сімулятары жыцця.
// 2. Знайсці ўсе гульні, якія выйшлі ў 2010 і пасля годзе.
// 3. Знайсці ўсе гульні, якія выйшлі ў мяжах 2008-2009 гадоў.
// 4. Знайсці ўсе гульні, якія былі апублікаваныя кампаніяй Maxis.
// 5. Знайсці ўсе гульні, апублікаваныя кампаніяй Alawar.
// 6. Атрымаць усю наяўную інфармацыю ў базе.
// 7. Знайсці 1 гульню, апублікаваную кампаніяй Maxis.
// 8. Знайсці 3 гульні, апублікаваныя кампаніяй Alawar.
// 9. Знайсці 5 гульняў, апублікаваных ці кампаніяй Alawar, цi Maxis.
// 10. Знайсці ўсе гульні, якія з'яўляюцца сімулятарамі.

// Запыты на мове cypher
1. MATCH (n:Game) WHERE n.genre="Life simulator" RETURN n
2. MATCH (n:Game) WHERE n.year >= 2010 RETURN n
3. MATCH (n:Game) WHERE n.year >= 2008 AND n.year <= 2009 RETURN n
4. MATCH (n:Game), (p:Publisher) WHERE p.name="Maxis" AND (n)-[:PUBLISHED_BY]->(p) RETURN n
5. MATCH (n:Game), (p:Publisher) WHERE p.name="Alawar" AND (n)-[:PUBLISHED_BY]->(p) RETURN n
6. MATCH (n) RETURN n
7. MATCH (n:Game), (p:Publisher) WHERE p.name="Maxis" AND (n)-[:PUBLISHED_BY]->(p) RETURN n LIMIT 1
8. MATCH (n:Game), (p:Publisher) WHERE p.name="Alawar" AND (n)-[:PUBLISHED_BY]->(p) RETURN n LIMIT 3
9. MATCH (n:Game), (p:Publisher) WHERE p.name="Maxis" OR p.name="Alawar" AND (n)-[:PUBLISHED_BY]->(p) RETURN n LIMIT 5
10. MATCH (n:Game) WHERE n.genre CONTAINS "simulator" RETURN n
