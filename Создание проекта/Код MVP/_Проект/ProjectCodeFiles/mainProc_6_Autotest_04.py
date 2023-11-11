import sqlite3
import pandas as pd 

# a: Вы будете выращивать растения дома, или на улице?

a_InHome = 0 
# 1 - На улице
# 2 - Дома

# a_1: Какая наименьшая температура бывает в вашем регионе?

a_1_MinTempInHome = 0
# 1 - [Поле ввода от 15 до 35]
a_1_input_MinTempInHome = 0
# 2 - Не имеет значения, так как я планирую выращивать растения летом

# a_2: Какая средняя температура в вашем доме?

a_2_AVGTempInRegion = 0
# 1 - [Поле ввода от 3 до 30]
a_2_input_AVGTempInRegion = 0

# a_2_1: Какая примерная влажность в вашем доме?

a_2_1_AVGHum = 0
# 1 - [Поле ввода от 20 до 90]
a_2_1_input_AVGHum = 0
# 2 - Сухо
# 3 - Влажно
# 4 - Умеренная влажность

# b: Вы хотите подобрать одно растение, или сразу несколько?

b_OncePlant = 0
# 1 - Одно
# 2 - Несколько

# c: Вы хотите, что бы это растение было с цветами, или без?

c_AFlowers = 0
# 1 - Без цветов
# 2 - Не важно
# 3 - С цветами

# c_3: Выберете желаемый цвет - один или несколько (вводите числа через пробел)

c_3_SelectAColor = ""
# 1 - Белый
# 2 - Красный
# 3 - Оранжевый
# 4 - Жёлтый
# 5 - Голубой
# 6 - Синий
# 7 - Филоетовый
# 8 - Розовый
# 9 - Серебрянный
# 10 - Бордовый
# 11 - Разноцветный

# d: Вы хотите, что бы это растение было плодоносным?

d_IsPlod = 0
# 1 - Да
# 2 - Не важно
# 3 - Нет

# e: Вы будете ставить растения на окне?

e_StandOnWindow = 0
# 1 - Да
# 2 - Нет

# e_1: На ваше окно падает прямой солнечный свет?

e_1_ASunLight = 0
# 1 - Да
# 2 - Иногда
# 3 - Очень редко

# f: Для вас важно, что бы растение вырабатывало кислород?

f_GenerateAOxugen = 0
# 1 - Да, важно
# 2 - Было бы неплохо, но это не очень важно
# 3 - Мне без разницы на это

# g: Как много пространства под растения, в вашем доме?

g_AFreeProstr = 0
# 1 - Очень мало
# 2 - Средне
# 3 - Достаточно много

# h: Насколько вы хотите оставлять растения без присмотра?

h_NoControl = 0
# 1 - Ненадолго (на 3-5 дней)
# 2 - На 1-2 недели
# 3 - До месяца








# a_InHome= 2
# a_2_AVGTempInRegion= 1
# a_2_input_AVGTempInRegion= 3
# a_2_1_AVGHum= 4
# b_OncePlant= 2
# c_AFlowers= 3
# c_3_SelectAColor = "розовый красный разноцветный"
# d_IsPlod= 2
# e_StandOnWindow= 1
# e_1_ASunLight= 2
# f_GenerateAOxugen= 2
# g_AFreeProstr= 3
# h_NoControl= 2
# a_1_MinTempInHome = 0
# a_1_input_MinTempInHome = 0

# Собираю SQL-запрос, на основе значений переменных

# 
# Не сделал группировку по климату
# Не сделал сортировку, по названию цвета "Зелёный"
# Не сделал использование цветных цветов
# 

import os

def clear_console():
    os.system('cls' if os.name == 'nt' else 'clear')

clear_console()

int_countTest = 0

int_IsDataFrameEmpty = 0

def Req():
    global int_IsDataFrameEmpty
    global a_2_1_input_AVGHum 

    strRequare = "SELECT * FROM MainTable WHERE "
    windowCompare = 7 # Окно на температуру
    windowCompare_2 = 45 # Окно на влажность
    windowCompare_Light = 3

    if a_InHome == 2:
        strRequare += "plant_type_description = 'Домашнее' "
    elif a_InHome == 1:
        strRequare += "plant_type_description = 'Уличное'"

    strRequare += " AND "

    if a_2_AVGTempInRegion == 2:
        if(a_2_input_AVGTempInRegion < 0):
            strRequare += "min_temperature >= " + a_2_input_AVGTempInRegion

    if a_2_AVGTempInRegion == 1:
        strRequare += "min_temperature >= " + str(a_1_input_MinTempInHome - 5)
        strRequare += " AND "
        strRequare += " max_temperature <= " + str(a_1_input_MinTempInHome + windowCompare)

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

    if bool1 == True or a_2_1_AVGHum == 1:
        strRequare += "min_humidity >= " + str(a_2_1_input_AVGHum - windowCompare_2)
        # strRequare += " AND "
        # strRequare += " max_humidity <= " + str(a_2_1_input_AVGHum + windowCompare_2)

    strRequare += " AND "

    if b_OncePlant == 2:
        strRequare += "(allelopathy_description = 'Нейтральная' OR allelopathy_description = 'Положительная')"

    strRequare += " AND "

    if c_AFlowers == 1:
        strRequare += "plant_color_description LIKE '%елёный%'"


    if(c_3_SelectAColor != ""):

        # 
        # Получается, мне нужно будет только подать верные названия цветов, как строку через пробел
        # 

        ### С цветами жесть, надо будет оч хорошо тестировать, уже в Web версии 
        ### Просто убирать первую букву у названия цвета, т.к. она может быть и заглавной и строчной

        # Возможно делать проверку на существование записей с таким цветом, при выборе его пользователем

        # Если такие цвета найти не получилось, то писать что-то типа "Извините, но в нашей базе данных нет растений с такими расцветками, для вас"
        # Вот растения, со всеми цветами: ...

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
        strRequare += "is_fruitful = 'true'"
    elif d_IsPlod == 3:
        strRequare += "is_fruitful = 'false'"

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
            sql_query = sql_query.replace(' AND  AND ', ' AND ') # Удаляю AND, если он появился 2 раза подряд

        sql_query = sql_query.rstrip() # Удаляю пробелы в конце строки

        if sql_query.endswith(' AND'):
            sql_query = sql_query[:-4] # Удаляю AND, если он вылез в коне запроса
        return sql_query

    outputRequare = remove_extra_and(strRequare) # Делаю строку без ошибок, как SQL-запрос

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
    df = pd.read_sql_query(outputRequare, connection)

    # Закрытие соединения с базой данных
    connection.close()

    # Вывод полученного ответа
    # print()
    print("Ответ БД:", end = "")
    # print()
    # print(df.to_string()) # ------------------------------------------------------------------------- <

    if(df.empty == True):
        int_IsDataFrameEmpty = int_IsDataFrameEmpty + 1
        print(" ---- ")
    else:
        print(" [Не пустой]")

    print()


# 
# ------------------------------
#           АВТОТЕСТ
# ------------------------------
# 


def part_3():
    global int_countTest
  
    global a_InHome
    global a_1_MinTempInHome 
    global a_1_input_MinTempInHome 
    global a_2_AVGTempInRegion 
    global a_2_input_AVGTempInRegion
    global a_2_1_AVGHum
    global a_2_1_input_AVGHum 
    global b_OncePlant 
    global c_AFlowers 
    global c_3_SelectAColor 
    global d_IsPlod 
    global e_StandOnWindow 
    global e_1_ASunLight 
    global f_GenerateAOxugen
    global g_AFreeProstr 
    global h_NoControl 

    for n in range(1, 4):
        h_NoControl = n
        int_countTest+=1    
        Req()
        print("Общее количество тестов: " + str(int_countTest))
        print("Количество пустых ответов БД: " + str(int_IsDataFrameEmpty))

def part_2():

    global a_InHome
    global a_1_MinTempInHome 
    global a_1_input_MinTempInHome 
    global a_2_AVGTempInRegion 
    global a_2_input_AVGTempInRegion
    global a_2_1_AVGHum
    global a_2_1_input_AVGHum 
    global b_OncePlant 
    global c_AFlowers 
    global c_3_SelectAColor 
    global d_IsPlod 
    global e_StandOnWindow 
    global e_1_ASunLight 
    global f_GenerateAOxugen
    global g_AFreeProstr 
    global h_NoControl 

    for g in range(1, 3):
        b_OncePlant = g

        for h in range(1, 4):
            c_AFlowers = h
            # if c_AFlowers == 3:
                # c_3_SelectAColor = "красный зеленый синий" # Пример ввода нескольких цветов
        
            for i in range(1, 4):
                d_IsPlod = i

                if(a_InHome == 2):
                    for j in range(1, 4):
                        e_StandOnWindow = j
                        if e_StandOnWindow == 1 or e_StandOnWindow == 3:
                            for k in range(1, 4):
                                e_1_ASunLight = k

                    for l in range(1, 4):
                        f_GenerateAOxugen = l

                        for m in range(1, 4):
                            g_AFreeProstr = m
                            part_3()
                else:
                    part_3()


for a in range(1, 3): # В доме или на улице 
    a_InHome = a
    if a_InHome == 1: # На улице
        for b in range(1, 3):
            a_1_MinTempInHome = b
            if(a_1_MinTempInHome == 1): # Минимальная температура на улице
                for c in range(-15, 0, 6):
                    a_2_input_AVGTempInRegion = c    
                    part_2()
            else:
                part_2()    
    else:
        for dd in range(15, 30, 6): # Указываю среднюю температуру в доме
            a_1_input_MinTempInHome = dd

            for e in range(1, 5): # Влажность 
                a_2_1_AVGHum = e
                if a_2_1_AVGHum == 1:
                    for f in range(20, 91, 10):
                        a_2_1_input_AVGHum = f
                        part_2()
                elif a_2_1_AVGHum == 2:
                    a_2_1_input_AVGHum = 35
                elif a_2_1_AVGHum == 3:
                    a_2_1_input_AVGHum = 80
                elif a_2_1_AVGHum == 4:
                    a_2_1_input_AVGHum = 55
                part_2()



# Когда после ответа пользователя на какой-то вопрос мы получаем пустой ответ, то мы говорим ему:
# К сожалению, у нас нет растений, подходящие под такие характеристики. Пожалуйста, измените ответ на этот, или на предыдущие вопросы

# Просто убирать первую букву у названия цвета, т.к. она может быть и заглавной и строчной

# Не тестировал с названиями цветов. На этом шаге точно стоит проверять не будет ли ответ пустым
# Либо предлагать доавить Зелёный цвет в выборку (или автоматим его добавлять, если выборка будет пустой)

# Всего на страничке выводить 3 карточки внизу
# Также будет кнопка "Показать больше", если есть что показывать





