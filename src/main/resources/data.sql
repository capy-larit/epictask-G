CREATE TABLE task (
	id bigint PRIMARY KEY auto_increment,
	title varchar(200),
	description TEXT,
	points int,
	status int DEFAULT 0,
	user_id int	
);

CREATE TABLE user (
	id bigint PRIMARY KEY auto_increment,
	name varchar(200),
	email varchar(200),
	password varchar(200),
	githubuser varchar(200)
);

CREATE TABLE ROLE(
	id int primary key auto_increment,
	name varchar(200)
);

CREATE TABLE USER_ROLES(
	user_id int,
	roles_id int
);

INSERT INTO ROLE (name) VALUES ('ROLE_ADMIN'), ('ROLE_USER');

INSERT INTO USER_ROLES VALUES 
(1,1),
(2,2),
(3,2)
;

INSERT INTO user (name, email, password, githubuser) VALUES
('Joao Carlos', 'joao@gmail.com', '$2a$12$iAFC7sgMoPSDNRV.6isc/.F1yT0R0L2tFypGPk6CQaRCFG/PiEjmO', 'joaocarloslima'),
('Carla Lopes', 'carla@gmail.com', '$2a$12$iAFC7sgMoPSDNRV.6isc/.F1yT0R0L2tFypGPk6CQaRCFG/PiEjmO', 'maria'),
('Fabio Cabrini', 'fabio@fiap.com.br', '$2a$12$iAFC7sgMoPSDNRV.6isc/.F1yT0R0L2tFypGPk6CQaRCFG/PiEjmO', 'pedro');


INSERT INTO task (title, description, points, status, user_id) VALUES 
	('Criar banco de dados',
	'Criar um banco de dados na nuvem com Oracle', 
	200,
	10,
	1);
	
	
INSERT INTO task (title, description, points, status) VALUES 
	('Protótipo','Criação de protótipo de alta fidelidade', 100, 50);
	
INSERT INTO task (title, description, points, status, user_id) VALUES 
	('API REST','Publicação de API com endpoints da aplicação', 150, 90, 2);