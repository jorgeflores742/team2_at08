"""
    Method for storage values(id)
"""
# -*- coding: utf-8 -*-
class Storage:
    """
        Class storage
    """
    container = None
    our_instance = None

    def __init__(self):
        """
            Method constructor
        """
        Storage.container = {}

    @staticmethod
    def get_instance():
        """
            Method for return instance
        :return:
        """
        if Storage.our_instance is None:
            instance = Storage()
        return instance

    @staticmethod
    def add_value(key, value):
        """
        Method for add value
        :param key: key
        :param value: value
        """
        Storage.container[key] = value

    @staticmethod
    def get_value(key):
        """
            Method for obtain value(key)
        :return: key
        """
        return Storage.container.get(key)

    @staticmethod
    def remove_value(key):
        """
        Method for remove value (key)
        :param key: key
        """
        del Storage.container[key]
