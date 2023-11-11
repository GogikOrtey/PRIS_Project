CREATE TABLE ClimateTypes (
    climate_type_id INT,
    climate_type_name VARCHAR(255),
    PRIMARY KEY (climate_type_id)
);

CREATE TABLE Allelopathy (
    allelopathy_id INT,
    allelopathy_description VARCHAR(255),
    PRIMARY KEY (allelopathy_id)
);

CREATE TABLE Plants (
    plant_id INT,
    plant_name VARCHAR(255),
    climate_type_id INT,
    allelopathy_id INT,
    PRIMARY KEY (plant_id),
    FOREIGN KEY (climate_type_id) REFERENCES ClimateTypes(climate_type_id),
    FOREIGN KEY (allelopathy_id) REFERENCES Allelopathy(allelopathy_id)
);

CREATE TABLE SunlightTolerance (
    sunlight_tolerance_id INT,
    sunlight_tolerance_description VARCHAR(255),
    PRIMARY KEY (sunlight_tolerance_id)
);

CREATE TABLE PlantTypes (
    plant_type_id INT,
    plant_type_description VARCHAR(255),
    PRIMARY KEY (plant_type_id)
);

CREATE TABLE PlantColors (
    plant_color_id INT,
    plant_color_description VARCHAR(255),
    PRIMARY KEY (plant_color_id)
);

CREATE TABLE PlantList (
    record_id INT,
    plant_id INT,
    min_light INT,
    max_light INT,
    sunlight_tolerance_id INT,
    min_humidity INT,
    max_humidity INT,
    min_temperature INT,
    max_temperature INT,
    plant_type_id INT,
    is_fruitful BOOLEAN,
    oxygen_production FLOAT,
    area_covered FLOAT,
    care_instructions VARCHAR(255),
    plant_color_id INT,
    PRIMARY KEY (record_id),
    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id),
    FOREIGN KEY (climate_type_id) REFERENCES ClimateTypes(climate_type_id),
    FOREIGN KEY (allelopathy_id) REFERENCES Allelopathy(allelopathy_id),
    FOREIGN KEY (sunlight_tolerance_id) REFERENCES SunlightTolerance(sunlight_tolerance_id),
    FOREIGN KEY (plant_type_id) REFERENCES PlantTypes(plant_type_id),
    FOREIGN KEY (plant_color_id) REFERENCES PlantColors(plant_color_id)
);


-- CREATE TABLE Plants (
--     plant_id INT,
--     plant_name VARCHAR(255),
--     climate_type_id INT,
--     allelopathy_id INT,
--     PRIMARY KEY (plant_id)
-- );