-- Top 10 estações de partida mais utilizadas por tipo de usuário

WITH estacoes_uso AS (
  SELECT
    start_station_name,
    member_casual,
    COUNT(*) AS total_partidas
  FROM
    cyclistic_trips
  WHERE
    start_station_name IS NOT NULL
  GROUP BY
    start_station_name, member_casual
)
SELECT *
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY total_partidas DESC) AS posicao
  FROM
    estacoes_uso
) AS ranked
WHERE posicao <= 10;
