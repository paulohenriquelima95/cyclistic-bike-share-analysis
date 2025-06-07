-- Análise do uso de bicicletas por hora e tipo de usuário

SELECT
  EXTRACT(HOUR FROM started_at) AS hora_dia,
  member_casual,
  COUNT(*) AS total_viagens
FROM
  cyclistic_trips
GROUP BY
  hora_dia, member_casual
ORDER BY
  hora_dia, member_casual;

