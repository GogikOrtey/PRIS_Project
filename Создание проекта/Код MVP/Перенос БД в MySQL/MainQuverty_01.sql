DROP TABLE IF EXISTS MainTable;

CREATE TABLE MainTable AS
SELECT 
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS 'Номер строки',
    P.plant_name AS 'Название растения',
    PL.min_light AS 'Освещение min',
    PL.max_light AS 'Освещение max',
    ST.sunlight_tolerance_description AS 'Переносимость прямого света',
    PL.min_humidity AS 'Влажность min',
    PL.max_humidity AS 'Влажность max',
    PL.min_temperature AS 'Температура min',
    PL.max_temperature AS 'Температура max',
    PT.plant_type_description AS 'Тип растения',
    PL.is_fruitful AS 'Плодоносное',
    PL.oxygen_production AS 'Выработка кислорода',
    PL.area_covered AS 'Занимаемая площадь растения',
    PL.care_instructions AS 'Уход за растениями (кол-во дней)',
    PC.plant_color_description AS 'Цвет растения',
    CT.climate_type_name AS 'Тип климата',
    A.allelopathy_description AS 'Аллелопатия',
    P.is_famous AS 'Известное растение?'
FROM 
    PlantList PL
JOIN 
    Plants P ON P.plant_id = PL.plant_id
JOIN 
    ClimateTypes CT ON CT.climate_type_id = P.climate_type_id
JOIN 
    Allelopathy A ON A.allelopathy_id = P.allelopathy_id
JOIN 
    SunlightTolerance ST ON ST.sunlight_tolerance_id = PL.sunlight_tolerance_id
JOIN 
    PlantTypes PT ON PT.plant_type_id = PL.plant_type_id
JOIN 
    PlantColors PC ON PC.plant_color_id = PL.plant_color_id;
