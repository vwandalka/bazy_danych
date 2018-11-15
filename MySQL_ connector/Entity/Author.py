from Entity.CommonEntity import CommonEntity
from Entity.PersonSurname import PersonSurname
from Entity.PersonName import PersonName
from EntityManager import Manager

class Author(CommonEntity):
    _table_name = 'authors'
    _id_name = 'author_id'

    _author_id = 0
    _author_name_id = 0
    _author_surname_id = 0

    _author_name = None
    _author_surname = None

    def get_author_id(self) -> int:
        """Zwraca id autora"""
        return self._author_id

    def set_author_name(self, author_name: PersonName) -> 'Author':
        """Ustawia imie autora"""
        self._author_name = author_name
        self._author_name_id = author_name.get_person_name_id()
        return self

    def set_author_surname(self, author_surname: PersonSurname) -> 'Author':
        """Ustawia nazwisko autora"""
        self._author_surname = author_surname
        self._author_surname_id = author_surname.get_person_surname_id()
        return self

    def get_author_name(self) -> PersonName:
        """Zwraca imie autora"""
        if self._author_name is None:
            self._author_name = Manager(PersonName()).find(self._author_name_id)
        return self._author_name

    def get_author_surname(self) -> PersonSurname:
        """Zwraca nazwisko autora"""
        if self._author_surname is None:
            self._author_surname = Manager(PersonSurname()).find(self._author_surname_id)
        return self._author_surname

    def to_dict(self) -> dict:
        return {
            'author_id': self.get_author_id(),
            'author_name_id': self._author_name_id,
            'author_surname_id': self._author_surname_id
        }

    def get_keys(self) -> list:
        return ['author_name_id', 'author_surname_id']

    def prepare_from_dict(self, params: dict) -> 'Author':
        self._author_id = params[0]
        self._author_name_id = params[1]
        self._author_surname_id = params[2]
        return self

    def __str__(self) -> str:
        return "{} {}".format(
            self.get_author_name(),
            self.get_author_surname()
        )