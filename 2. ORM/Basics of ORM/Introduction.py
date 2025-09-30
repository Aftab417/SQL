
################----------------  ORM (Object-Relational Mapping)  -------------------##################

#   It is a programming technique that lets you interact with database using objects in your 
#   programming language, instead of writing raw SQL querires.    



################----------------  Problem without  ORM  -------------------##################

# Normally to insert a student into student table, you have to write SQL:

#  SQL:
#   INSERT INTO students (id, name, marks)
#   VALUES
#   (1, 'Ali', 98),
#   (2, 'Ahmad', 90);

#   SELECT * FROM students WHERE id = 2;



#  You have to write raw SQL strings
#  Manually handle the results
#  Then you have to convert them into object for use in your code.





################----------------  What ORM  Does  -------------------##################

# ORM libraries map database tables to programming objects.

#   Each table  =   a class
#   Each row    =   an object
#   Each column =  an attribute    


#   Instead of writing SQL, you write code in your programming language(python, java, php) and
#   ORM translate it into SQL behind the sceneces.  



################----------------  Popular ORM  Frameworks  -------------------##################

#  Python         -->    SQLAlchemy,  Django ORM

#  Java           -->    Hibernate, JPA

#  Php            -->    Eloquent,  Doctrine

#  JavaScript     -->    Sequelize, TypeORM 

#  .NET           -->    Entity Framework





