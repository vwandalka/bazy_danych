from Entity.PersonSurname import PersonSurname
from Entity.PersonName import PersonName
from Entity.Publisher import Publisher
from Entity.Author import Author
from EntityManager import Manager
from Entity.VAuthor import VAuthor

# publisher = Manager(Publisher()).find(8)
# if publisher.get_publisher_id > 0:
#     publisher.set_publisher_name("Wydawca 8")
#     #publisher = Manager(Publisher()).find(8).set_publisher_name("Wydawca 8")
#     Manager(publisher).update()
# else:
#     print("Brak wydawcy")


print(
    Manager(VAuthor()).find(5)
)


# publisher = Publisher()
# publisher.set_publisher_name('Nowy wydawca 2')
# Manager(publisher).insert()

# print(
#     Manager(Publisher()).find(2)
# )
#
