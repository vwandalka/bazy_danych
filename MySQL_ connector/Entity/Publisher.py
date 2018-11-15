from Entity.CommonEntity import CommonEntity

class Publisher(CommonEntity):
    _table_name = 'publisher'
    _id_name = 'publisher_id'

    _publisher_id = 0
    _publisher_name = ''

    def set_publisher_id(self, publisher_id: int) -> 'Publisher':
        """Ustawia id wydawcy"""
        self._publisher_id = publisher_id
        return self                             # <- zwraca obiekt

    def get_publisher_id(self) -> int:
        """Zwraca id wydawcy"""
        return self._publisher_id

    def set_publisher_name(self, publisher_name: str) -> 'Publisher':
        """Ustawia nazwe wydawcy"""
        self._publisher_name = publisher_name
        return self                             # <- zwraca obiekt

    def get_publisher_name(self) -> str:
        """Zwraca nazwe wydawcy"""
        return self._publisher_name

    def __str__(self) -> str:
        return self._publisher_name

    def get_keys(self) -> list:
        return ['publisher_id', 'publisher_name']

    def to_dict(self) -> dict:
        return {
            'publisher_id': self._publisher_id,
            'publisher_name': self._publisher_name
        }

    def prepare_from_dict(self, params: dict) -> 'Publisher':
        self._publisher_id = params[0]
        self._publisher_name = params[1]
        return self