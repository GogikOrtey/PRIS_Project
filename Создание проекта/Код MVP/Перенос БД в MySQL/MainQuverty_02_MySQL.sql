-- Удаляем таблицу, если она уже существует
DROP TABLE IF EXISTS MainTable;

-- Создаём новую таблицу на основе вашего запроса
CREATE TABLE MainTable AS
SELECT 
    @row_number:=@row_number+1 AS `Номер строки`,
    P.plant_name,
    PL.min_light,
    PL.max_light,
    ST.sunlight_tolerance_description,
    PL.min_humidity,
    PL.max_humidity,
    PL.min_temperature,
    PL.max_temperature,
    PT.plant_type_description,
    PL.is_fruitful,
    PL.oxygen_production,
    PL.area_covered,
    PL.care_instructions,
    PC.plant_color_description,
    CT.climate_type_name,
    A.allelopathy_description,
    P.is_famous 
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

-- Добавляем 1й столбец - id строки
ALTER TABLE new_table ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;