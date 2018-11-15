# todo = open('todo_list.txt', 'w')       #   <-- 'a' - append, 'w' - write, 'r' - read only
# print('Wstać w dzień wolny', file=todo)
# print('Ogarnąć się', file=todo)
# print('Przyjechać na zajęcia', file=todo)
# todo.close()
#
# todo = open('todo_list.txt')
# for task in todo:
#     print(task, end='')
# todo.close()

# manager kontekstu
with open('todo_list.txt', 'r') as todo:
    for task in todo:
        print(task, end='')

