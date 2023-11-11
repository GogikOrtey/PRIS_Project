SELECT * 
FROM MainTable 
WHERE plant_type_description = 'Уличное' 
AND (allelopathy_description = 'Нейтральная' OR allelopathy_description = 'Положительная') 
--AND is_fruitful = true 
--AND (sunlight_tolerance_description = 'Нет' OR sunlight_tolerance_description = 'Средне') 
AND max_light <= 8 
AND area_covered <= 6 
AND (care_instructions >= 6)