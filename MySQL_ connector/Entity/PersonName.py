from Entity.CommonEntity import CommonEntity

class PersonName(CommonEntity):
    _table_name = 'person_name'
    _id_name = 'pn_id'

    _person_name_id = 0
    _person_name = ''

    def set_person_name_id(self, person_name_id: int) -> 'PersonName':
        """Ustawia id wydawcy"""
        self._person_name_id = person_name_id
        return self                             # <- zwraca obiekt

    def get_person_name_id(self) -> int:
        """Zwraca id wydawcy"""
        return self._person_name_id

    def set_person_name(self, person_name: str) -> 'PersonName':
        """Ustawia nazwe wydawcy"""
        self._person_name = person_name
        return self                             # <- zwraca obiekt

    def get_person_name(self) -> str:
        """Zwraca nazwe wydawcy"""
        return self._person_name

    def __str__(self) -> str:
        return self._person_name

    def get_keys(self) -> list:
        return ['pn_id', 'pn_name']

    def to_dict(self) -> dict:
        return {
            'pn_id': self._person_name_id,
            'pn_name': self._person_name
        }

    def prepare_from_dict(self, params: dict) -> 'PersonName':
        self._person_name_id = params[0]
        self._person_name = params[1]
        return self