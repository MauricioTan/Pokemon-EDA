USE pokemon_eda;
#Find out the highest total average points per primary type
SELECT 
  type_1,
  COUNT(*) AS number_of_pokemon,
  ROUND(AVG(total_points), 2) AS avg_total_points,
  ROUND(AVG(hp), 2) AS avg_hp,
  ROUND(AVG(attack), 2) AS avg_attack,
  ROUND(AVG(defense), 2) AS avg_defense,
  ROUND(AVG(sp_attack), 2) AS avg_sp_attack,
  ROUND(AVG(sp_defense), 2) AS avg_sp_defense,
  ROUND(AVG(speed), 2) AS avg_speed
FROM pokemon
GROUP BY type_1
ORDER BY avg_total_points DESC;
#Find out if dual types are stronger than single types per generation
SELECT 
  generation,
  type_number,
  COUNT(*) AS number_of_pokemon,
  ROUND(AVG(total_points), 2) AS avg_total_points,
  ROUND(AVG(hp), 2) AS avg_hp,
  ROUND(AVG(attack), 2) AS avg_attack,
  ROUND(AVG(defense), 2) AS avg_defense,
  ROUND(AVG(sp_attack), 2) AS avg_sp_attack,
  ROUND(AVG(sp_defense), 2) AS avg_sp_defense,
  ROUND(AVG(speed), 2) AS avg_speed
FROM pokemon
GROUP BY generation, type_number
ORDER BY avg_total_points DESC;

SELECT 
 CASE
    WHEN type_2 = 'none' THEN type_1
    WHEN type_1 < type_2 THEN CONCAT(type_1, '/', type_2)
    ELSE CONCAT(type_2, '/', type_1)
  END AS type_combo,
  COUNT(*) AS number_of_pokemon,
  ROUND(AVG(total_points), 2) AS avg_total_points,
  ROUND(AVG(hp), 2) AS avg_hp,
  ROUND(AVG(attack), 2) AS avg_attack,
  ROUND(AVG(defense), 2) AS avg_defense,
  ROUND(AVG(sp_attack), 2) AS avg_sp_attack,
  ROUND(AVG(sp_defense), 2) AS avg_sp_defense,
  ROUND(AVG(speed), 2) AS avg_speed
FROM pokemon
GROUP BY type_combo
ORDER BY avg_total_points DESC;

