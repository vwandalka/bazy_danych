from singleton import singleton
import mysql.connector


@singleton
class UseDatabase:

    def __init__(self, config: dict) -> None:
        """otwarcie połączenia"""
        self.configuration = config

    def __enter__(self) -> 'cursor':
        """konfiguracja kursora"""
        self.conn = mysql.connector.connect(**self.configuration)
        self.cursor = self.conn.cursor()
        return self.cursor

    def commit(self) -> None:
        self.conn.commit()

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """zamknięcie połączenia"""
        self.cursor.close()
        self.conn.close()

