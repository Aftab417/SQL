######################--------  DDL  commands in SQLAlechemy  -------------#################
#  These commands are related to databse and tables creations

from sqlalchemy import create_engine, Integer, String, Column
from sqlalchemy.orm import declarative_base  


# creating engine
engine = create_engine('sqlite:///collage.db')

# Base class for ORM
Base = declarative_base()





######################--------  Defining Tables  -------------#################

# define table named 'students'
class Student(Base):
    __tablename__ = 'students'  # table name

    id = Column(Integer, primary_key=True)
    name = Column(String(50))
    age = Column(Integer)









######################--------  Creating Tables  -------------#################

# creates all tables defined on Base subclass
Base.metadata.create_all(engine)

# creates specific table
Student.__table__.create(engine)






######################--------  Deleting Tables  -------------#################


# drops all tables
Base.metadate.drop_all(engine)

# deops specific table
Student.__table__.drop(engine)