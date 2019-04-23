import mysql.connector
from mysql.connector import Error


def connect():
    """ Connect to MySQL database """
    try:
        conn = mysql.connector.connect(host='localhost',
                                       database='tip_database',
                                       user='root',
                                       password='zaq1@WSX')
        if conn.is_connected():
            print('Connected to MySQL database')

    except Error as e:
        print(e)

    # finally:
    # conn.close()
    # print('MySQL database is closed')



if __name__ == '__main__':
    connect()