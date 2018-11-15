import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")

#print(type(myclient))

mydb = myclient["db_example"]

#print(type(mydb))

mycol = mydb["coll_example"]

#print(myclient.list_database_names())
#print(type(mycol))

doc1 = {"_id": 1, "name": "car", "model": "Porsche"}


try:
    doc1_insert = mycol.insert_one(doc1)
except:
    print("Dokument najduje sie juz w bazie danych")

#print(myclient.list_database_names())
#print(mydb.list_collection_names())
#print(type(doc1_insert))
#print(doc1_insert.inserted_id)

docs = [{"_id": 2, "name": "car", "model": "maluch"},
        {"_id": 3, "name": "car", "model": "Ferrari"},
        {"_id": 4, "name": "car", "model": "VW"},
        {"_id": 5, "name": "car", "model": "Toyota"},
        {"_id": 6, "name": "car", "model": "Mazda"}]

try:
    docs_insert = mycol.insert_many(docs)
except:
    print("Dokumenty sa juz w bazie danych")

#print(docs_insert.inserted_ids)

for doc in mycol.find():
    print(doc)

#sortowanie po id
for doc in mycol.find().sort('_id', pymongo.ASCENDING):
        print(doc)

for doc in mycol.find().sort("_id", pymongo.ASCENDING):
    if type(doc['_id']) != int:
        mycol.delete_one(doc)
    else:
        continue

for doc in mycol.find().sort('_id'):
    print(doc)

for doc in mycol.find().sory('_id', pymongo.ASCENDING):
    if type(doc['_id']) != int:
        mycol.delete_one(doc)