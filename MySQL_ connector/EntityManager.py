from DBcm import UseDatabase
from Entity.CommonEntity import CommonEntity


dbconfig = {
    'host': '127.0.0.1',
    'user': 'vwandalka',
    'password': 'zwierzaczek',
    'database': 'gup5'
}

class Manager:

   def __init__(self, entity: CommonEntity) -> None:
       self._entity = entity

   def __enter__(self) -> 'Manager':
       return self

   def find(self, element_id: int) -> 'CommonEntity':
       """Find element by ID"""
       sql = "select {} from {} where {} = {:d}".format(
           ', '.join(self._entity.to_dict().keys()),
           self._entity.get_table_name(),
           self._entity.get_id_name(),
           element_id
       )

       with UseDatabase(dbconfig) as cursor:
           cursor.execute(sql)
           elements = cursor.fetchone()

           if elements is not None:
               self._entity.prepare_from_dict(elements)

       return self._entity

   def insert(self) -> 'Manager':
       if isinstance(self._entity, ReadOnlyEntity):
           return self

       sql_elements = self._entity.to_dict()
       sql_elements.__delitem__(self._entity.get_id_name())

       sql = "insert into {} ({}) values ({})".format(
           self._entity.get_table_name(),
           ', '.join(sql_elements.keys()),
           ', '.join("'" + str(v) + "'" for v in sql_elements.values())
       )

       db_connect = UseDatabase(dbconfig)
       with db_connect as cursor:
           cursor.execute(sql)
           db_connect.commit()

       return self

   def update(self) -> 'Manager':
       if isinstance(self._entity, ReadOnlyEntity):
           return self

       sql_elements = self._entity.to_dict()
       element_id = sql_elements[self._entity.get_id_name()]
       sql_elements.__delitem__(self._entity.get_id_name())
       update_elements = []

       for key, value in sql_elements.items():
           update_elements.append("{} = '{}'".format(key, value))

       query = "update {} set {} where {} = {:d}".format(
           self._entity.get_table_name(),
           ', '.join(update_elements),
           self._entity.get_id_name(),
           element_id
       )

       db_connect = UseDatabase(dbconfig)
       with db_connect as cursor:
           cursor.execute(query)

           db_connect.commit()

       return self