from typing import Protocol

import pyodbc


class CarDataStorage(Protocol):
    """Interface for any storage saving car data."""
    def save(self, car_data) -> None:
        raise NotImplementedError


class DBCarDataStorage:
    """Store car data in db."""
    def __init__(self, database: str, server='localhost'):
        self._conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=' + server + ';UID=sa;PWD=Testpass123')

    def save(self, data: list, table):
        cursor = self._conn.cursor()
        cursor.fast_executemany = True
        query = 'INSERT INTO {}\n'.format(table) + 'VALUES {}'.format(data)
        cursor.execute(query)

    def format_data(self, data) -> tuple:
        pass


def save_car_data(car_data, storage: CarDataStorage):
    storage.save(car_data)
