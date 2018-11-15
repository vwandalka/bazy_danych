def singleton(class_) -> 'get_instance':
    instances = {}                      # <- jesli jest to pokaż

    def get_instance(*args, **kwargs):  # <- jesli nie ma to stworz
        if class_ not in instances:
            instances[class_] = class_(*args, **kwargs)     # <- argumenty bez kluczy (args), argumenty z kluczami (kwargs)
        return instances[class_]
    return get_instance
