SELECT * 
FROM MainTable 
WHERE plant_type_description = 'Домашнее'  
--AND min_humidity >= 0 
--AND  max_humidity <= 40 
--AND plant_color_description LIKE '%елёный%' 
AND is_fruitful = 'true' 
--AND oxygen_production >= 7 
--AND area_covered <= 4 
--AND (care_instructions >= 6)