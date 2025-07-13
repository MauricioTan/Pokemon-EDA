WITH all_stats AS (
  SELECT 'HP' AS stat, pokemon_name, hp AS value FROM pokemon_eda.pokemon
  UNION ALL
  SELECT 'Attack', pokemon_name, attack FROM pokemon_eda.pokemon
  UNION ALL
  SELECT 'Defense', pokemon_name, defense FROM pokemon_eda.pokemon
  UNION ALL
  SELECT 'Sp. Attack', pokemon_name, sp_attack FROM pokemon_eda.pokemon
  UNION ALL
  SELECT 'Sp. Defense', pokemon_name, sp_defense FROM pokemon_eda.pokemon
  UNION ALL
  SELECT 'Speed', pokemon_name, speed FROM pokemon_eda.pokemon
),
ranked AS (
  SELECT *, DENSE_RANK() OVER (PARTITION BY stat ORDER BY value DESC) AS rnk
  FROM all_stats
)
SELECT stat, pokemon_name, value
FROM ranked
WHERE rnk = 1;