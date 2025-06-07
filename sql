-- Calcula a duração média das viagens por estação de partida e tipo de usuário

SELECT
  start_station_name,
  member_casual,
  ROUND(AVG(EXTRACT(EPOCH FROM (ended_at - started_at)) / 60), 2) AS duracao_media_minutos,
  COUNT(*) AS total_viagens
FROM
  cyclistic_trips
WHERE
  start_station_name IS NOT NULL
GROUP BY
  start_station_name, member_casual
HAVING
  COUNT(*) > 50
ORDER BY
  duracao_media_minutos DESC;

