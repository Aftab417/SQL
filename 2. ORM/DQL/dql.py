###############---------------  DQL commands in SQLAlchemy  ------------------#################
#  These commands are used to querying the database



###############---------------  DDL setup  ------------------#################

from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import declarative_base, sessionmaker

engine = create_engine("sqlite:///college.db", echo=True)
Base = declarative_base()

class Student(Base):
    __tablename__ = "students"
    id = Column(Integer, primary_key=True)
    name = Column(String(50))
    age = Column(Integer)

    def __repr__(self):
        return f"<Student(id={self.id}, name='{self.name}', age={self.age})>"

Base.metadata.create_all(engine)

Session = sessionmaker(bind=engine)
session = Session()






#######################---------------  Basic SELECT  ------------------########################

#  All rows
session.query(Student).all()



#  First row
session.query(Student).first()



#  by primary key
session.get(Student, 1)



#  specific column
session.query(Student.name, Student.age).all()








#######################---------------  Filtering Rows  ------------------########################

#  Equality
session.query(Student).filter_by(name='Ali').all()


#  Expression
session.query(Student).flter(Student.age > 18).all()



#  Multiple conditions
from sqlalchemy import and_, or_

session.query(Student).filter(and_(Student.age > 18, Student.age < 25)).all()

session.query(Student).filter(or_(Student.name == 'Ali', Student.name == 'Aftab')).all()


# Like
session.query(Student).filter(Student.name.like('%A')).all()

# in
session.query(Student).filter(Student.age.in_([28, 18, 20])).all()

# between
session.query(Student).filter(Student.age.between(18, 22)).all()






#######################---------------  ORDERING  &  LIMITING  ------------------########################


# ordering rows
session.query(Student).order_by(Student.age.desc()).all()


# Limiing results
session.query(Student).limit(3).all()

session.query(Student).offset(2).limit(3).all()







#######################---------------  Aggregate Functions  ------------------########################
from sqlalchemy import func

# count
session.query(func.count(Student.id)).scalar()


# average
session.query(func.avg(Student.age)).scalar()


#  minimum
session.query(func.min(Student.age)).scalar()


#  maximum
session.query(func.max(Student.age)).scalar()








#######################---------------  Grouping Rows  ------------------########################

# grouping based on student age
session.query(Student.age, func.count(Student.id)).group_by(Student.age).all()