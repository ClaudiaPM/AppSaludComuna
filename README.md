# 
 
# Dependencias

* cors npm i cors
* dotenv npm i dotenv
* express npm i express
* mongoose npm i mongoose
* multer npm i multer
* nodemon npm install -g nodemon
* express-validator npm i express-validator
* npm i mongoose-delete  -S eliminado logico


para generar un nueva llave jwt debes de tener creado tu archivo .env en la razi principal de tu proyecto

y luego correr este comando
npm run jwt:secret




npm i 


Correr el proyecto

*-----npm run dev-----*
<h1 align="center"> Hackaton SaludJEBCA </h1>
![image](https://github.com/ClaudiaPM/Hackaton_SaludJEBCA/assets/37117102/b2202248-fc4f-4c15-b171-6bb79f760006)

base de datos provisional

CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  age VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('user', 'admin') DEFAULT 'user',
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL
);

CREATE TABLE tokens (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  expire_at DATETIME NOT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES usuarios(id)
);





This is a group project in development with the aim of participating in the Hackaton program



<h1>Estado del proyecto:</h1>
  :construction: Proyecto en construcción :construction:
  
  
  
  <h1>Desarrolladores:</h1>
