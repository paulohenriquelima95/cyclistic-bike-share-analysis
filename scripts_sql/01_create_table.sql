-- Criação da tabela com tipos apropriados
CREATE TABLE rides (
    ride_id VARCHAR(50) PRIMARY KEY,
    rideable_type VARCHAR(20),
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    end_station_name TEXT,
    member_casual VARCHAR(10),
    ride_length_minutes FLOAT,
    day_of_week VARCHAR(10),
    month VARCHAR(10),
    hour INTEGER
);