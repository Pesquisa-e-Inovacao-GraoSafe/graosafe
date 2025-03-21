SELECT 
idTemperatura as "Identificação",
idSensor as "Identificação do Sensor",
idCliente as "Identificação do Cliente",
CONCAT(temperatura,'°C') as 'Temperatura',
CASE WHEN temperatura > 30 or temperatura < 20 
THEN "ALERTA" 
ELSE "Valor Ideal" END as Controle,
dtRegistro as 'Data de Registro' from temperatura;

SELECT * FROM temperatura WHERE temperatura > 30 or temperatura < 20;