-- Exemplo de importação (via PostgreSQL CLI ou pgAdmin)
-- Você pode adaptar para o caminho do seu arquivo CSV

COPY rides(
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, end_station_name, member_casual
)
FROM 'C:\seu_caminho\arquivo.csv'
DELIMITER ';' CSV HEADER;