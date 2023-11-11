SELECT * 
FROM MainTable 
WHERE plant_type_description = 'Уличное' 
AND min_temperature >= -2
AND min_humidity >= 35 
AND  max_humidity <= 75 
AND (allelopathy_description = 'Нейтральная' OR allelopathy_description = 'Положительная') 
--AND (plant_color_description LIKE '%елёный%')
AND (plant_color_description LIKE '%озовый%' OR plant_color_description LIKE '%расный%' OR plant_color_description LIKE '%азноцветный%') 
AND min_light >= 4 
AND (sunlight_tolerance_description = 'Да' OR sunlight_tolerance_description = 'Средне') 
AND oxygen_production >= 5 
AND (care_instructions >= 6 
AND care_instructions < 15)