from sqlalchemy import create_engine, Integer, String, Column, ForeignKey
from sqlalchemy.orm import declarative_base, relationship, sessionmaker


# creating engine
engine = create_engine('sqlite:///collage.db')


# creating Base object
Base = declarative_base()


# creating session object
Session = sessionmaker(bind=engine)
session = Session() 




#  Define Student table
class Student(Base):
    __tablename__ = 'students'

    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False )

    courses = relationship('Course', back_populates='student', cascade='all, delete-orphan')





#  Define Course table
class Course(Base):
    __tablename__ = 'course'

    id = Column(Integer, primary_key=True)
    name = Column(String(50))
    student_id = Column(Integer, ForeignKey(Student.id))

    student = relationship('Student', back_populates='courses')



# Querying tables
student = session.query(Student).filter_by(name='Aftab').one()  
print(student.courses)


course = session.query(Course).filter(Course.id == 1).one()
print(course.student)