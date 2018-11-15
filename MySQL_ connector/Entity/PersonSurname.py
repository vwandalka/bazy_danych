from Entity.CommonEntity import CommonEntity


class PersonSurname(CommonEntity):
    _table_name = 'person_surname'
    _id_name = 'ps_id'

    _person_surname_id = 0
    _person_surname = ''

    def set_person_surname_id(self, person_surname_id: int) -> 'PersonSurname':
        """Ustawia id wydawcy"""
        self._person_surname_id = person_surname_id
        return self                             # <- zwraca obiekt

    def get_person_surname_id(self) -> int:
        """Zwraca id wydawcy"""
        return self._person_surname_id

    def set_person_surname(self, person_surname: str) -> 'PersonSurname':
        """Ustawia nazwe wydawcy"""
        self._person_surname = person_surname
        return self                             # <- zwraca obiekt

    def get_person_surname(self) -> str:
        """Zwraca nazwe wydawcy"""
        return self._person_surname

    def __str__(self) -> str:
        return self._person_surname

    def get_keys(self) -> list:
        return ['ps_id', 'ps_surname']

    def to_dict(self) -> dict:
        return {
            'ps_id': self._person_surname_id,
            'ps_surname': self._person_surname
        }

    def prepare_from_dict(self, params: dict) -> 'PersonSurname':
        self._person_surname_id = params[0]
        self._person_surname = params[1]
        return self