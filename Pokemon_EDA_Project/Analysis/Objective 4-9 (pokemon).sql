# Objective 4
#bar chart or radar/spiderchart
#Stat differences across pokemon statuses
SELECT 
  status_cleaned, 
  COUNT(*) AS number_of_pokemon,
  ROUND(AVG(total_points), 2) AS avg_total_points,
  ROUND(AVG(hp), 2) AS avg_hp,
  ROUND(AVG(attack), 2) AS avg_attack,
  ROUND(AVG(defense), 2) AS avg_defense,
  ROUND(AVG(sp_attack), 2) AS avg_sp_attack,
  ROUND(AVG(sp_defense), 2) AS avg_sp_defense,
  ROUND(AVG(speed), 2) AS avg_speed
FROM pokemon_eda.pokemon
GROUP BY status_cleaned
ORDER BY avg_total_points DESC;

#Objective 5
#Stat trend per generation (line chart)
SELECT 
  generation,
  ROUND(AVG(total_points),2) AS avg_total_points,
  ROUND(AVG(hp), 2) AS avg_hp,
  ROUND(AVG(attack), 2) AS avg_attack,
  ROUND(AVG(defense), 2) AS avg_defense,
  ROUND(AVG(sp_attack), 2) AS avg_sp_attack,
  ROUND(AVG(sp_defense), 2) AS avg_sp_defense,
  ROUND(AVG(speed), 2) AS avg_speed
  FROM pokemon_eda.pokemon
GROUP BY generation
ORDER BY generation;

#Objective 6
#Correlation of catch rate and pokemon strength
#scatter plot (correlation in python)
SELECT
ROUND(total_points, -1) AS stat_range,
COUNT(*) AS num_of_pokemon,
ROUND(AVG(catch_rate), 2) AS avg_catch_rate
FROM pokemon_eda.pokemon
WHERE catch_rate != -1
GROUP BY ROUND(total_points, -1)
ORDER BY stat_range;

#Objective 8
#growth rate per primary type (Stacked bar chart)
SELECT 
  type_1,
  growth_rate,
  COUNT(*) AS number_of_pokemon
FROM pokemon_eda.pokemon
GROUP BY type_1, growth_rate
ORDER BY type_1, number_of_pokemon DESC;

#Objective 9 
#Top 10 strongest pokemon by total stats

SELECT 
  pokemon_name,
  total_points
FROM pokemon_eda.pokemon
ORDER BY total_points DESC
LIMIT 10;