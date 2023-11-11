import sqlite3
import pandas as pd # Импортирую библиотеку pandas, для вывода таблиц запросов

# Убираю ограничения по количеству строк в таблице
# pd.set_option('display.max_rows', None)
# pd.set_option('display.max_columns', None)
# pd.set_option('display.width', None)

con = sqlite3.connect("booking_py_01.sqlite")
str_way = 'D:/Рабочий стол/Учёба 4й курс 2023/Сетевые/1 лаба - работа с SQLite/Lab_01 IDZ/booking.db'
f_damp = open(str_way,'r', encoding ='utf-8-sig')

damp = f_damp.read()
f_damp.close()
con.executescript(damp)
conn = sqlite3.connect("booking_py_01.sqlite")

con.commit()
cursor = con.cursor()

cursor.execute('''
    123
''')