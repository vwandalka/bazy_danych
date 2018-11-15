from mysql import connector
import sys

dbconfig = {
    'host': '127.0.0.1',
    'user': 'vwandalka',
    'password': 'zwierzaczek',
    'database': 'gup5'
}

# stwórz połączenie z bazą i kursor do obsługi:
conn = mysql.connector.connect(**dbconfig)
# stwórz kursor do nawigacji
cursor = conn.cursor()

menu = int(input('Wybierz jedną z opcji: 1 - dodaj książkę; 2 - zmień wpis; 3 - usuń książke.'))

if menu == 1:
    # Dodaj książkę:
    book_title = input("Podaj tytuł książki: ")
    book_isbn = input("Podaj ISBN książki: ")

    # Wybierz wydawcę:
    sql = """select * from publisher"""
    cursor.execute(sql)
    publisher = cursor.fetchone()  # <-- fetchall pobiera wszystko
    possible_publishers = []

    print("Wydawcy w bazie: ")
    while publisher is not None:
        possible_publishers.append(publisher[0])
        print(publisher[0], "-", publisher[1])
        publisher = cursor.fetchone()
    publisher_id = 0

    while publisher_id not in possible_publishers:
        publisher_id = int(input('Podaj ID Wydawcy: '))

    sql = """insert into book(book_title, book_isbn, publisher_id) values (%s, %s, %s)"""
    cursor.execute(sql, (book_title, book_isbn, publisher_id))
    conn.commit()

if menu == 2:
    #Zmień wpis:
    sql = """select * from book"""
    cursor.execute(sql)
    book = cursor.fetchone()
    possible_books = []
    print("Książki w bazie: ")
    while book is not None:
        possible_books.append(book[0])
        print(book[0], "-", book[1])
        book = cursor.fetchone()
    book_id = 0

    while book_id not in possible_books:
        book_id = int(input('Podaj ID Książki: '))
        book_title = input('Podaj tytuł książki: ')
        book_isbn = input('Podaj isbn: ')
        sql = """update book set book_title = %s, book_isbn = %s where book_id = %s"""
        cursor.execute(sql, (book_title, book_isbn, book_id))
        conn.commit()

if menu == 3:
    #Usuń:
    sql = """select * from book"""
    cursor.execute(sql)
    book = cursor.fetchone()
    possible_books = []
    print("Wybierz książkę do usunięcia: ")
    while book is not None:
        possible_books.append(book[0])
        print(book[0], "-", book[1])
        book = cursor.fetchone()

    book_id = 0

    while book_id not in possible_books:
        book_id = int(input('Podaj ID Książki: '))

    is_deleted = int(input('0 - zachowaj, 1 - usuń'))

    sql = """update book set is_deleted = %s where book_id = %s"""

    cursor.execute(sql, (is_deleted, book_id))
    conn.commit()

cursor.close()
conn.close()

