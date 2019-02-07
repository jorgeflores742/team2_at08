# -*- coding: utf-8 -*-
class Storage:
    container = None
    our_instance = None

    def __init__(self):
        Storage.container = {}

    @staticmethod
    def get_instance():
        if Storage.our_instance is None:
            instance = Storage()
        return instance

    @staticmethod
    def add_value(key, value):
        Storage.container[key] = value

    @staticmethod
    def get_value(key):
        return Storage.container.get(key)

    @staticmethod
    def remove_value(key):
        del Storage.container[key]
