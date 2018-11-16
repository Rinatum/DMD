import time

from try_connection import create_connection, stop_connection

conn = create_connection()
time.sleep(3)
stop_connection(conn)