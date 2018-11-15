from Entity.CommonEntity import CommonEntity
from Entity.ReadOnlyEntity import ReadOnlyEntity


class VAuthor(CommonEntity, ReadOnlyEntity):
    _table_name = 'v_authors'
    _id_name = 'author_id'

    _author_id = 0
    _author_name = ''
    _author_surname = ''

    def get_author_id(self) -> int:
        return self._author_id

    def get_author_name(self) -> str:
        return self._author_name

    def get_author_surname(self) -> str:
        return self._author_surname

    def to_dict(self) -> dict:
        return {
            'author_id': self.get_author_id(),
            'author_name': self.get_author_name(),
            'author_surname': self.get_author_surname()
        }

    def prepare_from_dict(self, params: dict) -> 'VAuthor':
        self._author_id = params[0]
        self._author_name = params[1]
        self._author_surname = params[2]

        return self

    def __str__(self) -> str:
        return "{} {}".format(
            self.get_author_name(),
            self.get_author_surname()
        )