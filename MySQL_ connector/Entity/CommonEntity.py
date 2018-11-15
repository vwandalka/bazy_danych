class CommonEntity:

    _table_name = ''
    _id_name = ''

    def get_table_name(self) -> str:
        return self._table_name

    def get_id_name(self) -> str:
        return self._id_name

    def get_keys(self) -> list:
        pass

    def to_dict(self) -> dict:
        pass

    def prepare_from_dict(self, params: dict) -> 'CommonEntity':
        pass