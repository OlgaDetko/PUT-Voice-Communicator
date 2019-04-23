from mysql.connector import MySQLConnection, Error
from python_mysql_dbconfig import read_db_config
from datetime import datetime
#http://www.mysqltutorial.org/python-mysql-insert/

now = datetime.now()
formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')


def insert_user(user_id, email_address, password, user_name, join_date, status, description, last_login):
    query = "INSERT INTO users(user_id, email_address, password, user_name, join_date, status, description, last_login) " \
            "VALUES(%s,%s,%s,%s,%s,%s,%s,%s)"
    args = (user_id, email_address, password, user_name, join_date, status, description, last_login)


    try:
        db_config = read_db_config()
        conn = MySQLConnection(**db_config)

        cursor = conn.cursor()
        cursor.execute(query, args)

        if cursor.lastrowid:
            print('last insert id', cursor.lastrowid)
        else:
            print('last insert id not found')

        conn.commit()
    except Error as error:
        print(error)

    finally:
        cursor.close()
        conn.close()


def main():
    insert_user(1002, 'xyz@onet.pl', 'qwertyuiopasdfghjkl_0001', 'unknown001', formatted_date, 1, 'sample_description', formatted_date)


if __name__ == '__main__':
    main()

