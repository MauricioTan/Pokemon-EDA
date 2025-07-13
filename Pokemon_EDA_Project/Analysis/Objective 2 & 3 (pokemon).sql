#Objective 2 (Finding out how many pokemon were added per generation)
SELECT 
	generation,
	count(*) AS num_pokemon
FROM pokemon_eda.pokemon
GROUP BY generation
ORDER BY generation;

#Objective 3 (Dual Type Frequency & Trends)

# use this for a stacked bar chart, to find out how many pokemon in each generation are single-type vs. dual-type
SELECT 
  generation,
  type_number,
  COUNT(*) AS number_of_pokemon
FROM pokemon
GROUP BY generation, type_number
ORDER BY generation, type_number;

#Find out what's the most common dual type
SELECT 
  CASE
    WHEN type_1 < type_2 THEN CONCAT(type_1, '/', type_2)
    ELSE CONCAT(type_2, '/', type_1)
  END AS type_combo,
  COUNT(*) AS number_of_pokemon
FROM pokemon
WHERE type_2 != 'none'
GROUP BY type_combo
ORDER BY number_of_pokemon DESC LIMIT 11;

#Heatmap query for objective 3
SELECT 
  LEAST(type_1, type_2) AS type_x,
  GREATEST(type_1, type_2) AS type_y,
  COUNT(*) AS number_of_pokemon
FROM pokemon
WHERE type_2 != 'none'
GROUP BY type_x, type_y
ORDER BY number_of_pokemon DESC;