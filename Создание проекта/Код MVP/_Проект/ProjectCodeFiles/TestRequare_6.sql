SELECT * 
FROM MainTable 
ORDER BY 
    is_famous DESC,
    CASE allelopathy_description 
        WHEN 'Положительная' THEN 1 
        WHEN 'Нейтральная' THEN 2 
        ELSE 3 
    END,    
    CASE plant_color_description 
        WHEN 'разноцветный' THEN 1 
        WHEN 'белый' THEN 2 
        WHEN 'жёлтый' THEN 3 
        WHEN 'голубой' THEN 4 
        WHEN 'серебристый' THEN 5 
        WHEN 'бордовый' THEN 6 
        WHEN 'красный' THEN 7 
        WHEN 'оранжевый' THEN 8 
        WHEN 'пёстрый' THEN 9 
        WHEN 'пурпурный' THEN 10 
        WHEN 'розовый' THEN 11 
        WHEN 'синий' THEN 12 
        WHEN 'фиолетовый' THEN 13
        WHEN 'Зелёный с белой каймой' THEN 14
        WHEN 'Зелёный с белыми или розовыми разводами' THEN 15
        WHEN 'Зелёный с красными прицветниками' THEN 16
        WHEN 'Зелёный с пятнами' THEN 17
        WHEN 'Зелёный с разноцветными прожилками' THEN 18
        WHEN 'Зелёный с серебристым оттенком' THEN 19
        ELSE 20
    END,
    area_covered ASC,
    oxygen_production DESC;