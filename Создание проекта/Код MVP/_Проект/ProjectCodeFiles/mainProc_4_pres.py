
a_InHome= 2
a_2_AVGTempInRegion= 1
a_2_input_AVGTempInRegion= 3
a_2_1_AVGHum= 4
b_OncePlant= 2
c_AFlowers= 3
c_3_SelectAColor = "розовый красный разноцветный"
d_IsPlod= 2
e_StandOnWindow= 1
e_1_ASunLight= 2
f_GenerateAOxugen= 2
g_AFreeProstr= 3
h_NoControl= 2
a_1_MinTempInHome = 0
a_1_input_MinTempInHome = 0

# Собираю SQL-запрос, на основе значений переменных

# 
# Не сделал группировку по климату
# Не сделал сортировку, по названию цвета "Зелёный"
# Не сделал использование цветных цветов
# 

strRequare = "SELECT * FROM MainTable WHERE "

# Окна, используемые при вводе температуры и влажности:
windowCompare = 5
windowCompare_2 = 10


if a_InHome == 1:
    strRequare += "plant_type_description = 'Домашнее' "
elif a_InHome == 2:
    strRequare += "plant_type_description = 'Уличное'"

strRequare += " AND "

if a_1_MinTempInHome == 1:
    strRequare += "min_temperature >= " + a_1_input_MinTempInHome

if a_2_AVGTempInRegion == 1:
    strRequare += "min_temperature >= " + str(a_2_input_AVGTempInRegion - windowCompare)
    strRequare += " AND "
    strRequare += " max_temperature <= " + str(a_2_input_AVGTempInRegion + windowCompare)

strRequare += " AND "

bool1 = False

if a_2_1_AVGHum == 2:
    a_2_1_input_AVGHum = 35
    bool1 = True
elif a_2_1_AVGHum == 3:
    a_2_1_input_AVGHum = 80
    bool1 = True
elif a_2_1_AVGHum == 4:
    a_2_1_input_AVGHum = 55
    bool1 = True

if bool1 == True:
    strRequare += "min_humidity >= " + str(a_2_1_input_AVGHum - windowCompare_2)
    strRequare += " AND "
    strRequare += " max_humidity <= " + str(a_2_1_input_AVGHum + windowCompare_2)
elif a_2_1_AVGHum == 1:
    strRequare += "min_humidity >= " + str(a_2_1_input_AVGHum - windowCompare_2)
    strRequare += " AND "
    strRequare += " max_humidity <= " + str(a_2_1_input_AVGHum + windowCompare_2)

strRequare += " AND "

if b_OncePlant == 2:
    strRequare += "(allelopathy_description = 'Нейтральная' OR allelopathy_description = 'Положительная')"

strRequare += " AND "

if c_AFlowers == 1:
    strRequare += "plant_color_description LIKE '%зелёный%'"


# 
# Получается, мне нужно будет только подать верные названия цветов, как строку через пробел
# 

# Импортируем необходимые библиотеки
import pandas as pd

# Создаём таблицу с данными
data = pd.DataFrame({'plant_color_description': ['белый', 'жёлтый', 'голубой', 'серебристый', 'бордовый', 'красный', 'оранжевый', 'пёстрый', 'пурпурный', 'разноцветный', 'розовый', 'синий', 'фиолетовый']})

# Создаём строку с цветами
colors = c_3_SelectAColor #"жёлтый белый зелёный"

# Разбиваем строку на список цветов
colors_list = colors.split()

# Создаём запрос на основе списка цветов
query = "(plant_color_description LIKE '%" + colors_list[0] + "%'"
for color in colors_list[1:]:
    query += " OR plant_color_description LIKE '%" + color + "%'"

query += ")"

strRequare += query

strRequare += " AND "

if d_IsPlod == 1:
    strRequare += "is_fruitful = true"
elif d_IsPlod == 3:
    strRequare += "is_fruitful = false"

strRequare += " AND "

if e_StandOnWindow == 2:
    strRequare += "(sunlight_tolerance_description = 'Нет' OR sunlight_tolerance_description = 'Средне')"
    strRequare += " AND "
    strRequare += "max_light = 6"
elif e_StandOnWindow == 1:
    strRequare += "min_light = 4"

strRequare += " AND "

if e_1_ASunLight == 1 or e_1_ASunLight == 2:
    strRequare += "(sunlight_tolerance_description = 'Да' OR sunlight_tolerance_description = 'Средне')"

strRequare += " AND "

if f_GenerateAOxugen == 1:
    strRequare += "oxygen_production >= 7"
elif f_GenerateAOxugen == 2:
    strRequare += "oxygen_production >= 5"

strRequare += " AND "

if g_AFreeProstr == 1:
    strRequare += "area_covered <= 4"
elif g_AFreeProstr == 2:
    strRequare += "area_covered <= 6"

strRequare += " AND "

if h_NoControl == 1:
    strRequare += "care_instructions < 6"
elif h_NoControl == 2:
    strRequare += "(care_instructions >= 6 AND care_instructions < 15)"

print()
print(strRequare)
print()

def remove_extra_and(sql_query):
    while ' AND  AND ' in sql_query:
        sql_query = sql_query.replace(' AND  AND ', ' AND ')
    return sql_query

outputRequare = remove_extra_and(strRequare)

print()
print(outputRequare)
print()
