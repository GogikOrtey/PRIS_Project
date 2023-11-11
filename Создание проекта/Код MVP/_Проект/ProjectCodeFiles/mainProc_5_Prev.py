import sqlite3
import pandas as pd 



a_InHome = 2
a_2_AVGTempInRegion = 1
a_2_input_AVGTempInRegion = 25
a_2_1_AVGHum = 3
b_OncePlant = 1
c_AFlowers = 2
d_IsPlod = 2
e_StandOnWindow = 1
e_1_ASunLight = 1
f_GenerateAOxugen = 3
g_AFreeProstr = 3
h_NoControl = 1

# Собираю SQL-запрос, на основе значений переменных

# 
# Не сделал группировку по климату
# Не сделал сортировку, по названию цвета "Зелёный"
# Не сделал использование цветных цветов
# 

strRequare = "SELECT * FROM MainTable WHERE "

# Окна, используемые при вводе температуры и влажности:
windowCompare = 7
windowCompare_2 = 20
windowCompare_Light = 3
a_1_MinTempInHome = 0
a_1_input_MinTempInHome = 0


if a_InHome == 2:
    strRequare += "plant_type_description = 'Домашнее' "
elif a_InHome == 1:
    strRequare += "plant_type_description = 'Уличное'"

strRequare += " AND "

if a_1_MinTempInHome == 2:
    strRequare += "min_temperature >= " + a_1_input_MinTempInHome

if a_2_AVGTempInRegion == 1:
    strRequare += "min_temperature >= " + str(a_2_input_AVGTempInRegion - 5)
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

if d_IsPlod == 1:
    strRequare += "is_fruitful = true"
elif d_IsPlod == 3:
    strRequare += "is_fruitful = false"

strRequare += " AND "

if e_StandOnWindow == 2:
    strRequare += "(sunlight_tolerance_description = 'Нет' OR sunlight_tolerance_description = 'Средне')"
    strRequare += " AND "
    strRequare += "max_light <= 8"
elif e_StandOnWindow == 1:
    strRequare += "min_light >= 3"

strRequare += " AND "

#if e_1_ASunLight == 1 or e_1_ASunLight == 2:
    #strRequare += "(sunlight_tolerance_description = 'Да' OR sunlight_tolerance_description = 'Средне')"

#strRequare += " AND "

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
    strRequare += "(care_instructions >= 6)"

# print()
# print(strRequare)
# print()

def remove_extra_and(sql_query):
    while ' AND  AND ' in sql_query:
        sql_query = sql_query.replace(' AND  AND ', ' AND ')
    return sql_query

outputRequare = remove_extra_and(strRequare)

print()
print("Запрос:" + outputRequare)
print()

# 
# Обращаюсь к БД:
# 

# Убираю ограничения по количеству строк в таблице
pd.set_option('display.max_rows', None)
pd.set_option('display.max_columns', None)
pd.set_option('display.width', None)

# Подключение к базе данных
connection = sqlite3.connect('Plants_01.db')

# Отправка запроса и получение ответа в виде pandas DataFrame
query = outputRequare
df = pd.read_sql_query(query, connection)

# Закрытие соединения с базой данных
connection.close()

# Вывод полученного ответа
print()
print("Ответ БД:")
print()
print(df.to_string())