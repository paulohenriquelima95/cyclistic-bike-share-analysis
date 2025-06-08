-- Comparação entre membros e casuais (contagem de viagens)
SELECT member_casual, COUNT(*) AS total_viagens
FROM rides
GROUP BY member_casual;

-- Duração média das viagens por tipo de usuário
SELECT member_casual, ROUND(AVG(ride_length_minutes), 2) AS media_duracao
FROM rides
GROUP BY member_casual;

-- Uso por dia da semana
SELECT day_of_week, member_casual, COUNT(*) AS total
FROM rides
GROUP BY day_of_week, member_casual
ORDER BY FIELD(day_of_week, 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo');

-- Estações mais usadas por usuários casuais
SELECT start_station_name, COUNT(*) AS total_partidas
FROM rides
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY total_partidas DESC
LIMIT 10;