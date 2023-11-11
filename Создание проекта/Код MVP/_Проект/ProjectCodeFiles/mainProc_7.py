import sqlite3
import pandas as pd 
import os

def clear_console():
    os.system('cls' if os.name == 'nt' else 'clear')

clear_console()

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










def get_input(prompt, min_value, max_value):
    while True:
        try:
            value = int(input(prompt))
            if min_value <= value <= max_value:
                return value
            else:
                print(f"Пожалуйста, введите число от {min_value} до {max_value}.")
        except ValueError:
            print("Пожалуйста, введите целое число.")

# a: Вы будете выращивать растения дома, или на улице?
a_InHome = get_input("Вы будете выращивать растения дома, или на улице? (1 - На улице, 2 - Дома): ", 1, 2)

if a_InHome == 1:
    # a_1: Какая наименьшая температура бывает в вашем регионе?
    a_2_AVGTempInRegion  = get_input("Какая наименьшая температура бывает в вашем регионе? (1 - [Поле ввода от -20 до 35], 2 - Не имеет значения, так как я планирую выращивать растения летом): ", 1, 2)
    if a_2_AVGTempInRegion == 1:
        a_2_AVGTempInRegion = get_input("Введите минимальную температуру: ", -20, 35)
else:
    # a_2: Какая средняя температура в вашем доме?
    a_1_input_MinTempInHome = get_input("Какая средняя температура в вашем доме? ", 15, 30)
    a_2_AVGTempInRegion = 1

    # a_2_1: Какая примерная влажность в вашем доме?
    a_2_1_AVGHum = get_input("Какая примерная влажность в вашем доме? (1 - [Поле ввода от 20 до 90], 2 - Сухо, 3 - Влажно, 4 - Умеренная влажность): ", 1, 4)
    if a_2_1_AVGHum == 1:
        a_2_1_input_AVGHum = get_input("Введите примерную влажность: ", 20, 90)

# b: Вы хотите подобрать одно растение, или сразу несколько?
b_OncePlant = get_input("Вы хотите подобрать одно растение, или сразу несколько? (1 - Одно, 2 - Несколько): ", 1, 2)

# c: Вы хотите, что бы это растение было с цветами, или без?
c_AFlowers = get_input("Вы хотите, что бы это растение было с цветами, или без? (1 - Без цветов, 2 - Не важно, 3 - С цветами): ", 1, 3)

str_all_colors =    """
                    зелёный
                    белый
                    жёлтый
                    голубой
                    серебристый
                    бордовый
                    красный
                    оранжевый 
                    пёстрый
                    пурпурный
                    разноцветный
                    розовый
                    синий
                    фиолетовый
                    """

if c_AFlowers == 3:
    # c_3: Выберете желаемый цвет - один или несколько (вводите числа через пробел)
    c_3_SelectAColor = input("Выберете желаемый цвет - один или несколько (вводите названия цветов, через пробел): ")

# d: Вы хотите, что бы это растение было плодоносным?
d_IsPlod = get_input("Вы хотите, что бы это растение было плодоносным? (1 - Да, 2 - Не важно, 3 - Нет): ", 1, 3)

if(a_InHome == 2):
    # e: Вы будете ставить растения на окне?
    e_StandOnWindow = get_input("Вы будете ставить растения на окне? (1 - Да, 2 - Нет, 3 - Не знаю точно): ", 1, 3)

    if e_StandOnWindow == 1 or e_StandOnWindow == 3:
        # e_1: На ваше окно падает прямой солнечный свет?
        e_1_ASunLight = get_input("На ваше окно падает прямой солнечный свет? (1 - Да, 2 - Иногда, 3 - Очень редко): ", 1, 3)

    # f: Для вас важно, что бы растение вырабатывало кислород?
    f_GenerateAOxugen = get_input("Для вас важно, что бы растение вырабатывало кислород? (1 - Да, важно, 2 - Было бы неплохо, но это не очень важно, 3 - Мне без разницы на это): ", 1, 3)

    # g: Как много пространства под растения, в вашем доме?
    g_AFreeProstr = get_input("Как много пространства под растения, в вашем доме? (1 - Очень мало, 2 - Средне, 3 - Достаточно много): ", 1, 3)

# h: Насколько вы хотите оставлять растения без присмотра?
h_NoControl = get_input("Насколько вы хотите оставлять растения без присмотра? (1 - Ненадолго (на 3-5 дней), 2 - На 1-2 недели, 3 - До месяца): ", 1, 3)








# -----------------------------
# Вывожу все ответы на вопросы:

# print(f"a_InHome: {a_InHome}")
# if a_InHome == 1:
#     print(f"a_1_MinTempInHome: {a_1_MinTempInHome}")
#     if a_1_MinTempInHome == 1:
#         print(f"a_1_input_MinTempInHome: {a_1_input_MinTempInHome}")
# else:
#     print(f"a_2_AVGTempInRegion: {a_2_AVGTempInRegion}")
#     if a_2_AVGTempInRegion == 1:
#         print(f"a_2_input_AVGTempInRegion: {a_2_input_AVGTempInRegion}")
#     print(f"a_2_1_AVGHum: {a_2_1_AVGHum}")
#     if a_2_1_AVGHum == 1:
#         print(f"a_2_1_input_AVGHum: {a_2_1_input_AVGHum}")

# print(f"b_OncePlant: {b_OncePlant}")

# print(f"c_AFlowers: {c_AFlowers}")
# if c_AFlowers == 3:
#     print(f"c_3_SelectAColor: {c_3_SelectAColor}")

# print(f"d_IsPlod: {d_IsPlod}")

# print(f"e_StandOnWindow: {e_StandOnWindow}")
# if e_StandOnWindow == 1:
#     print(f"e_1_ASunLight: {e_1_ASunLight}")

# print(f"f_GenerateAOxugen: {f_GenerateAOxugen}")

# print(f"g_AFreeProstr: {g_AFreeProstr}")

# print(f"h_NoControl: {h_NoControl}")









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


def Req():
    global int_IsDataFrameEmpty
    global a_2_1_input_AVGHum 

    strRequare = "SELECT plant_name FROM MainTable WHERE "
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
        strRequare += "oxygen_production >= 5"
    elif f_GenerateAOxugen == 2:
        strRequare += "oxygen_production >= 3"

    strRequare += " AND "

    if g_AFreeProstr == 1:
        strRequare += "area_covered <= 4"
    elif g_AFreeProstr == 2:
        strRequare += "area_covered <= 7"

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

    global str_SortMainReq # Запрос сортировки в нужном мне порядке
    outputRequare += str_SortMainReq

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
    print("Ответ БД:") #, end = "")
    print()
    print(df.to_string()) # ------------------------------------------------------------------------- <

    # if(df.empty == True):
    #     int_IsDataFrameEmpty = int_IsDataFrameEmpty + 1
    #     print(" ---- ")
    # else:
    #     print(" [Не пустой]")

    print()

# Сортировка по полям, для лучшего представления:
# Цвет - сначала разноцветный, потом цвета, потом зелёный с оттенками, потом просто зелёный
# Аллелопатия - сначала положительная, потом нейтральная
# Популярное - true
# Занимаемое пространсово - по возрастанию
# Производство кислорода - по убыванию

str_SortMainReq = """
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
    """

Req()


# Когда после ответа пользователя на какой-то вопрос мы получаем пустой ответ, то мы говорим ему:
# К сожалению, у нас нет растений, подходящие под такие характеристики. Пожалуйста, измените ответ на этот, или на предыдущие вопросы




# Нужно убирать первую букву у названия цвета, т.к. она может быть и заглавной и строчной

# Не тестировал с названиями цветов. На этом шаге точно стоит проверять не будет ли ответ пустым
# Либо предлагать доавить Зелёный цвет в выборку (или автоматим его добавлять, если выборка будет пустой)




# Всего на страничке выводить 3 карточки внизу
# Также будет кнопка "Показать больше", если есть что показывать

# Если растений на выходе получилось много (>=7), то мы делаем их набором карточек на 7 мест.






