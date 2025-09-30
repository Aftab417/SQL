#############-------------  DML commands in SQLAlchemy  ---------------#################

#  In SQL, DML covers:
#  INSERT  -->  add rows
#  UPDATE  -->  modify rows
#  DELETE  -->  delete rows

# But in sqlalchemy orm, these map to:
#  session.add() /  session.add_all() 
#  modify object attribute + session.commit()
#  session.delete





#############-------------  Reuse from DDL step ---------------#################

from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import declarative_base, sessionmaker

# Engine
engine = create_engine("sqlite:///college.db", echo=True)

# Base
Base = declarative_base()

# ORM Model
class Student(Base):
    __tablename__ = "students"
    id = Column(Integer, primary_key=True)
    name = Column(String(50))
    age = Column(Integer)

    def __repr__(self):
        return f"<Student(id={self.id}, name='{self.name}', age={self.age})>"

# Create tables
Base.metadata.create_all(engine)

# Session factory
Session = sessionmaker(bind=engine)
session = Session()







##############------------------  INSERT (ADD data)  -------------------#################

# inset single row
s1 = Student(name='Ali', age=20)

session.add(s1)

session.commit()






#  insert multiple rows
s2 = Student(name='Aftab', age=21)
s3 = Student(name='Taha', age=22)

session.add_all([s2, s3])

session.commit()










##############------------------  UPDATE (Modify data)  -------------------#################

# object based update

student = session.query(Student).filter_by(name = 'Ali').first()

student.age = 19    # just change attribute

session.commit()





# Bulk update (without loading object)
session.query(Student).filter(Student.name == 'Ali').update(
    {Student.age : 19},
    synchronize_session=False    # skip loading object into session
)

session.commit()








##############------------------  Delete  -------------------#################


# object based delete

student = session.query(Student).filter_by(name='Ali').first()

session.delete(student)

session.commit()





#  bulk delete (without loading object)

session.query(Student).filter(Student.age < 18).delete(synchronize_session=False)

session.commit()    
