-- Cálculo da duração da viagem em minutos
UPDATE rides
SET ride_length_minutes = EXTRACT(EPOCH FROM (ended_at - started_at)) / 60
WHERE ended_at > started_at;

-- Remover registros inválidos (duração negativa ou nula)
DELETE FROM rides
WHERE ride_length_minutes IS NULL OR ride_length_minutes <= 0;

-- Normalização dos dias da semana em português
UPDATE rides
SET day_of_week = CASE
    WHEN EXTRACT(DOW FROM started_at) = 0 THEN 'Domingo'
    WHEN EXTRACT(DOW FROM started_at) = 1 THEN 'Segunda'
    WHEN EXTRACT(DOW FROM started_at) = 2 THEN 'Terça'
    WHEN EXTRACT(DOW FROM started_at) = 3 THEN 'Quarta'
    WHEN EXTRACT(DOW FROM started_at) = 4 THEN 'Quinta'
    WHEN EXTRACT(DOW FROM started_at) = 5 THEN 'Sexta'
    WHEN EXTRACT(DOW FROM started_at) = 6 THEN 'Sábado'
END;

-- Extração de mês e hora
UPDATE rides
SET
    month = TO_CHAR(started_at, 'Month'),
    hour = EXTRACT(HOUR FROM started_at);