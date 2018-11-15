from DBcm import UseDatabase

dbconfig = {
    'host': '127.0.0.1',
    'user': 'vwandalka',
    'password': 'zwierzaczek',
    'database': 'gup5'
}

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

with UseDatabase(dbconfig) as cursor:
    sql = 'select * from book'
    cursor.exeute(sql)
    row = cursor.fetchone()

    while row is not None:
        print(row)
        row = cursor.fetchone()

