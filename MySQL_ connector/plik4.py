from DBcm import UseDatabase

dbconfig = {
    'host': '127.0.0.1',
    'user': 'vwandalka',
    'password': 'zwierzaczek',
    'database': 'gup5'
}
#dbConnect = UseDatabase(dbconfig)
#with dbConnect as cursor:
    #sql = 'select * from book'
    #cursor.execute(sql)
    #row = cursor.fetchone()

    # while row is not None:
    #     print(row)
    #     row = cursor.fetchone()


# menu = int(input('Wybierz opcję: 1 - zarządzanie książką; 2 - zarządzanie autorem.'))
#
# if menu == 1:
    # zarzadzanie ksiazka:

def funkcja():
    menu_ksiazka = int(
        input('Wybierz jedną z opcji: 1 - dodaj książkę; 2 - zmień wpis; 3 - usuń książke; 4 - wyświetl książki.'))

    if menu_ksiazka == 1:
        # Dodaj książkę:
        book_title = input("Podaj tytuł książki: ")
        book_isbn = input("Podaj ISBN książki: ")

        dbConnect = UseDatabase(dbconfig)
        with dbConnect as cursor:
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

            sql = """insert into book(book_title, book_isbn, book_publisher_id) values (%s, %s, %s)"""
            cursor.execute(sql, (book_title, book_isbn, publisher_id))

    if menu_ksiazka == 2:
        #Zmień wpis:
        dbConnect = UseDatabase(dbconfig)
        with dbConnect as cursor:
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

    if menu_ksiazka == 3:
        #Usuń:
        dbConnect = UseDatabase(dbconfig)
        with dbConnect as cursor:
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

    if menu_ksiazka == 4:
        #Zmień wpis:
        dbConnect = UseDatabase(dbconfig)
        with dbConnect as cursor:
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
funkcja()

# if menu == 2:
#     # zarzadzanie autorem:
#     menu_autor = int(
#         input('Wybierz jedną z opcji: 1 - dodaj autora; 2 - zmień wpis; 3 - usuń autora; 4 - wyświetl autorów.'))
#
#     with dbConnect as cursor:
#
#        if menu_autor == 1:
#            def insert_authors():
#                sql = """SELECT * FROM v_authors"""
#                cursor.execute(sql)
#                author = cursor.fetchone()
#                possible_author_name = []
#                possible_author_surname = []
#
#                print('Autorzy w bazie')
#                while author is not None:
#                     possible_author_name.append(author[1])
#                     possible_author_surname.append(author[2])
#                     print("{} - {} - {}".format(author[0], author[1], author[2]))
#                     author = cursor.fetchone()
#
#                author_id = 0
#
#                while author_id not in possible_author_name or author_id not in possible_author_surname:
#                    author_name = input("Podaj nowe imię: ")
#                    author_surname = input("Podaj nowe nazwisko: ")
#
#                    sql = """INSERT into authors(author_name_id, author_surname_id) VALUES(f_insert_person_name(%s),f_insert_person_surname(%s))"""
#                    cursor.execute(sql,(author_name, author_surname))
#                    break
#
#            insert_authors()
#
#     if menu_autor == 2:
#         # Zmień wpis:
#         with UseDatabase(dbconfig) as cursor:
#             sql = """select * from authors"""
#             cursor.execute(sql)
#             authors = cursor.fetchone()
#             possible_authors = []
#             print("Autorzy w bazie: ")
#             while authors is not None:
#                 possible_authors.append(authors[0])
#                 print(authors[0], "-", authors[1])
#                 authors = cursor.fetchone()
#             author_id = 0
#
#             while author_id not in possible_authors:
#                 author_id = int(input('Podaj ID autora: '))
#                 author_name = input('Podaj imię autora: ')
#                 author_surname = input('Podaj nazwisko autora: ')
#                 sql = """update authors set author_id = %s, author_name = %s where author_surname = %s"""
#                 cursor.execute(sql, (author_id, author_name, author_surname))
#
#     if menu_autor == 3:
#         # Usuń:
#         with UseDatabase(dbconfig) as cursor:
#             sql = """select * from authors"""
#             cursor.execute(sql)
#             authors = cursor.fetchone()
#             possible_authors = []
#             print("Wybierz autora do usunięcia: ")
#             while authors is not None:
#                 possible_authors.append(authors[0])
#                 print(authors[0], "-", authors[1])
#                 author = cursor.fetchone()
#             author_id = 0
#
#             while author_id not in possible_authors:
#                 author_id = int(input('Podaj ID autora: '))
#
#             is_deleted = int(input('0 - zachowaj, 1 - usuń'))
#             sql = """update authors set is_deleted = %s where author_id = %s"""
#             cursor.execute(sql, (is_deleted, author_id))

