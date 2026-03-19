-- Cria o banco do microserviço de email (as tabelas são criadas pelo Hibernate ddl-auto=update)
CREATE DATABASE IF NOT EXISTS basilios_email;
GRANT ALL PRIVILEGES ON basilios_email.* TO 'basilios'@'%';
FLUSH PRIVILEGES;
