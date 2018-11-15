#1. menu z którego wybierzemy akcję do wykonania (CRUD)
#2. po wybraniu akcji wyświetl odpowiednią wartość llub formularz
#3. znowu menu

import mysql.connector
import sys

dbconfig = {
    'host': '127.0.0.1',
    'user': 'vwandalka',
    'password': 'zwierzaczek',
    'database': 'gup5'
}

#stwórz połączenie z bazą i kursor do obsługi:
conn = mysql.connector.connect(**dbconfig)
#stwórz kursor do nawigacji
cursor = conn.cursor()

#Dodaj książkę i isbn.
book_title = input('Podaj tytuł książki: ')
book_isbn = input('Podaj isbn: ')

sql = """select * from publisher"""
cursor.execute(sql)
publisher = cursor.fetchone()   # <-- fetchall pobiera wszystko
possible_publishers = []

#Wybierz wydawcę"
print("Wydawcy w bazie: ")
while publisher is not None:
    possible_publishers.append(publisher[0])
    print(publisher[0], "-", publisher[1])
    publisher = cursor.fetchone()
publisher_id = 0

while publisher_id not in possible_publishers:
    publisher_id = int(input('Podaj ID Wydawcy: '))

#dodanie zawartości do bazy:
#sql = """insert into book(book_title, book_isbn, book_publisher_id) values (%s, %s, %s)"""
#"""select * from v_authors order by author_id"""

#dodaj input do bazy:
#cursor.execute(sql, (book_title, book_isbn, 3))

#dodaj pozycję do bazy:
#cursor.execute(sql, ('Jakas nowa ksiazka', '2097841kj290', '1'))

# row = cursor.fetchone()

#pobierz rząd i pobieraj następny aż do wyczerpania rzędów:
# while row is not None:
#     print(row)
#     row = cursor.fetchone()

#commit do bazy:
conn.commit()

cursor.close()
conn.close()

