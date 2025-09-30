####################-------------  Declarative Base & Classes  -----------------#################

#  Declarative Base:
#   The Base class is foundation of all ORM models. It holds metadata and keeps track of all mapped classes.


from sqlalchemy import Column, Integer, String, create_engine
from sqlalchemy.orm import declarative_base


#  creating engine
engine = create_engine('sqlite:///collage.db', echo=True)


#  Base class for ORM
Base = declarative_base()





####################-------------  Sessions  -----------------#################

#  The 'session' is your workspace with the database.
#  Think of it like a staging zone.
#  we add python objects(rows)
#  changes are tracked in memory
#  only when we call .commit() do they get written in db.


from sqlalchemy.orm import sessionmaker


# session factory
Session = sessionmaker(bind=engine)


# creates a session
session = Session()

