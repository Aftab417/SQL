
#  This is lower-level layer where you build queries in python without using ORM model. It is very close
#  to raw SQL but safer and more flexible.



###################-----------------  Creating Engine  --------------------##################
#  The engine is gateway to the database, It manages connections and execute SQL.

from sqlalchemy import create_engine

engine = create_engine('sqlite:///collage.db', echo=True)

# echo=True  --> logs SQL statements for learning and debugging

#  In production we use the connection URL like
#  PostgreSQL --> postgresql+psycopg2://user:pass@localhost/dbname
#  MySQL  --->  mysql+pymysql://user:pass@localhost/dbname



###################-----------------  MetaData & Table Defination  --------------------##################

# MetaData -->  containers that holds the defination of your tables
# Table  --> represents one database table

from sqlalchemy import MetaData, Table, Column, String, Integer

# creating a metadata object
metadata = MetaData()


# creating a table name 'students'
students = Table(
    'students',    # table mame
    metadata,
    Column('id', Integer, primary_key=True),
    Column('name', String(20)),
    Column('age', Integer),
)


# This will create all the tables in DB
metadata.create_all(engine)






###################-----------------  Insert Data  --------------------##################

from sqlalchemy import insert

with engine.connect() as conn:
    # single insert
    stmt = insert(students).values(name='Aftab', age= 18)
    conn.execute(stmt)


    # Multiple rows insert
    conn.execute(
        insert(students),
        [
            {'name':'Ali', 'age':19},
            {'name':'Taha', 'age':20}
        ]
    )

    conn.commit()   # Important!

     





###################-----------------  Querying (Select)  --------------------##################

from sqlalchemy import select

with engine.connect() as conn:
    stmt = select(students)
    result = conn.execute(stmt)

    for row in result:
        print(row)


#  filtering with condition
stmt = select(students).where(students.c.age > 19)
# students.c.<colomn>  --> access column





###################-----------------  Update  --------------------##################

from sqlalchemy import update

with engine.connect() as conn:
    stmt = (
        update(students)
        .where(students.c.name == 'Aftab')
        .values(age=19)
    )

    conn.execute(stmt)
    conn.commit()





###################-----------------  Delete  --------------------##################

from sqlalchemy import delete

with engine.connect() as conn:
    stmt = delete(students).where(students.c.name == 'Aftab')

    conn.execute(stmt)
    conn.commit()









###################-----------------  Common Pitfalls  --------------------##################

# Forget to commit → Inserts/updates won’t persist.

# students.c.column_name is how you reference columns in Core.

# Use engine.connect() (for short sessions) or Session(engine) (when you move to ORM).