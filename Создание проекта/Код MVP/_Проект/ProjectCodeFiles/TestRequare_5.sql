SELECT * 
FROM MainTable 
WHERE plant_type_description = 'Домашнее'  
--AND min_temperature >= 25 
AND  max_temperature <= 37 
AND min_humidity >= -10 
AND (allelopathy_description = 'Нейтральная' OR allelopathy_description = 'Положительная') 
AND plant_color_description LIKE '%елёный%' 
--AND is_fruitful = 'true' 
AND min_light >= 3 
AND oxygen_production >= 7 
AND area_covered <= 6 
AND (care_instructions >= 6)