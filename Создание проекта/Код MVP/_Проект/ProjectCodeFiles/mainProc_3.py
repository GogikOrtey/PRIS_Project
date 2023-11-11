

# Создаю переменные для заполнения, при ответах пользователя:

# Изначально, взаимодействие с пользователем будет вестись, с помощью терминала.
# Каждая переменная - это вопрос. Они промаркированы начальной буквой в названии
# Для каждой переменной, будет приведены возможные варианты ответов
# Обычно, эти парианты ответов - это числа (1, 2, 3, ...)
# но в некторых вариантах ответе будет поле для ввода. Туда пользователь должен будет ввести целое число, как ответ
# 
# При вводе ответа пользователем, его нужно записать в эту переменную
# 
# Все вопросы также промаркированы буквой, в начале. Они написаны в коментариях, перед вопросом
# У некоторых вопросов есть несколько вариантов ответа. Например, у вопроса a есть варианты ответа a_1 и a_2
# То есть, если на вопрос a пользователь ответил 1, то следующим ему задаётся вопрос a_1
# Если он ответил на вопрос a_1 ответом 2, то мледующим ему задаётся вопрос a_1_2, и т.д.
# Если вопросы кончились (например, если вопроса a_1_2 нет), то мы задаём пользователю следующий вопрос: b
# 
# Если в ответе указано поле ввода (например: 1 - [Поле ввода от -20 до +35])
# то нужно обработать ввод данных от пользователя. Он может вводить туда только целые числа
# если число, введённое пользователем не попадает в указанные рамки, то терминал должен 
# указать на эту ошибку пользователю, вывести допустимые пределы ввода, и попросить ввести данные ещё раз
# 
# Это значение, введённое пользователем, хранится в дополнительной переменной. 
# Она называется [идентефикатор вопроса]_input_[название вопроса]. Например: a_1_input_MinTempInHome
# 
# При выборе цвета, на вопросе c_3_SelectAColor, пользователь дожет будет ввести одно, или несколько числе, через пробел
# Нужно будет записать все эти числа (как строку)
# 
# Тебе нужно реализовать для этот меня терминал. 


# a: Вы будете выращивать растения дома, или на улице?

a_InHome = 0 
# 1 - На улице
# 2 - Дома

# a_1: Какая наименьшая температура бывает в вашем регионе?

a_1_MinTempInHome = 0
# 1 - [Поле ввода от -20 до 35]
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

c_3_SelectAColor = 0
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
    a_1_MinTempInHome = get_input("Какая наименьшая температура бывает в вашем регионе? (1 - [Поле ввода от -20 до 35], 2 - Не имеет значения, так как я планирую выращивать растения летом): ", 1, 2)
    if a_1_MinTempInHome == 1:
        a_1_input_MinTempInHome = get_input("Введите минимальную температуру: ", -20, 35)
else:
    # a_2: Какая средняя температура в вашем доме?
    a_2_AVGTempInRegion = get_input("Какая средняя температура в вашем доме? (1 - [Поле ввода от 3 до 30]): ", 1, 1)
    if a_2_AVGTempInRegion == 1:
        a_2_input_AVGTempInRegion = get_input("Введите среднюю температуру: ", 3, 30)

# a_2_1: Какая примерная влажность в вашем доме?
a_2_1_AVGHum = get_input("Какая примерная влажность в вашем доме? (1 - [Поле ввода от 20 до 90], 2 - Сухо, 3 - Влажно, 4 - Умеренная влажность): ", 1, 4)
if a_2_1_AVGHum == 1:
    a_2_1_input_AVGHum = get_input("Введите примерную влажность: ", 20, 90)

# b: Вы хотите подобрать одно растение, или сразу несколько?
b_OncePlant = get_input("Вы хотите подобрать одно растение, или сразу несколько? (1 - Одно, 2 - Несколько): ", 1, 2)

# c: Вы хотите, что бы это растение было с цветами, или без?
c_AFlowers = get_input("Вы хотите, что бы это растение было с цветами, или без? (1 - Без цветов, 2 - Не важно, 3 - С цветами): ", 1, 3)

if c_AFlowers == 3:
    # c_3: Выберете желаемый цвет - один или несколько (вводите числа через пробел)
    c_3_SelectAColor = input("Выберете желаемый цвет - один или несколько (вводите числа через пробел) (1 - Белый, ..., 11 - Разноцветный): ")

# d: Вы хотите, что бы это растение было плодоносным?
d_IsPlod = get_input("Вы хотите, что бы это растение было плодоносным? (1 - Да, 2 - Не важно, 3 - Нет): ", 1, 3)

# e: Вы будете ставить растения на окне?
e_StandOnWindow = get_input("Вы будете ставить растения на окне? (1 - Да, 2 - Нет): ", 1, 2)

if e_StandOnWindow == 1:
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

print(f"a_InHome: {a_InHome}")
if a_InHome == 1:
    print(f"a_1_MinTempInHome: {a_1_MinTempInHome}")
    if a_1_MinTempInHome == 1:
        print(f"a_1_input_MinTempInHome: {a_1_input_MinTempInHome}")
else:
    print(f"a_2_AVGTempInRegion: {a_2_AVGTempInRegion}")
    if a_2_AVGTempInRegion == 1:
        print(f"a_2_input_AVGTempInRegion: {a_2_input_AVGTempInRegion}")
    print(f"a_2_1_AVGHum: {a_2_1_AVGHum}")
    if a_2_1_AVGHum == 1:
        print(f"a_2_1_input_AVGHum: {a_2_1_input_AVGHum}")

print(f"b_OncePlant: {b_OncePlant}")

print(f"c_AFlowers: {c_AFlowers}")
if c_AFlowers == 3:
    print(f"c_3_SelectAColor: {c_3_SelectAColor}")

print(f"d_IsPlod: {d_IsPlod}")

print(f"e_StandOnWindow: {e_StandOnWindow}")
if e_StandOnWindow == 1:
    print(f"e_1_ASunLight: {e_1_ASunLight}")

print(f"f_GenerateAOxugen: {f_GenerateAOxugen}")

print(f"g_AFreeProstr: {g_AFreeProstr}")

print(f"h_NoControl: {h_NoControl}")



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
    strRequare += "max_temperature <= " + (a_2_input_AVGTempInRegion + windowCompare)

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
    strRequare += "min_humidity >= " + (a_2_1_input_AVGHum - windowCompare_2)
    strRequare += "max_humidity <= " + (a_2_1_input_AVGHum + windowCompare_2)
elif a_2_1_AVGHum == 1:
    strRequare += "min_humidity >= " + (a_2_1_input_AVGHum - windowCompare_2)
    strRequare += "max_humidity <= " + (a_2_1_input_AVGHum + windowCompare_2)

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

strRequare = query

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

print(strRequare)

outputRequare = ' AND '.join(list(set(strRequare.split(' AND '))))

print(strRequare)

