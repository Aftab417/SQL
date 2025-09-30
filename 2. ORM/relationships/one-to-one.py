from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.orm import declarative_base, relationship, sessionmaker


# creating engine
engine = create_engine('sqlite:///collage.db')

# ceating Base object
Base = declarative_base()


# Creating session object
Session = sessionmaker(bind=engine)
session = Session()



#  Define Student table
class Student(Base):
    __tablename__ = 'students'

    id = Column(Integer, primary_key=True)
    name = Column(String(20))
    # relationship with Profile table via 'profile' attribute
    profile = relationship('Profile', back_populates='student', uselist=False, cascade='all, delete-orphan')






#  Define Profile table
class Profile(Base):
    __tablename__ = 'profile'

    id = Column(Integer, primary_key=True)
    bio = Column(String(50))      
    student_id = Column(Integer, ForeignKey(Student.id), unique=True)
    # relationship with Student table via 'student' attribute
    student = relationship('Student', back_populates='profile')


#  creating tables
Base.matadata.create_all(engine)




# inserting data
s1 = Student(name='Aftab')
p1 = Profile(bio='AI enthusiast')

s1.profile = p1

session.add(s1)        # This will add both student and profile in there respective tables
session.commit()




#  querying tables
s = session.query(Student).filter_by(name='Aftab').one()
print(s.profile.bio)



p = session.query(Profile).filter(Profile.id == 1)
print(p.student.name)