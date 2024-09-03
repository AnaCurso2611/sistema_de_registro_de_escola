CREATE DATABASE IF NOT EXISTS SistemaEscolar;
USE SistemaEscolar;

CREATE TABLE alunos (
    alunoID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    dataNascimento DATE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE cursos (
    cursoID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE notas (
    notaID INT AUTO_INCREMENT PRIMARY KEY,
    alunoID INT,
    cursoID INT,
    nota DECIMAL(5,2) CHECK (nota BETWEEN 0 AND 10),
    dataNota DATE NOT NULL,
    FOREIGN KEY (alunoID) REFERENCES alunos(alunoID),
    FOREIGN KEY (cursoID) REFERENCES cursos(cursoID)
);

INSERT INTO alunos (nome, dataNascimento, email, telefone) VALUES
('João Silva', '2000-05-15', 'joao.silva@example.com', '123456789'),
('Maria Oliveira', '1998-09-22', 'maria.oliveira@example.com', '987654321'),
('Carlos Santos', '2001-11-30', 'carlos.santos@example.com', '555123456');

INSERT INTO cursos (nome, descricao) VALUES
('Matemática', 'Curso de Matemática básica e avançada.'),
('História', 'Curso de História mundial e local.'),
('Programação', 'Curso de introdução à programação e desenvolvimento de software.');

INSERT INTO notas (alunoID, cursoID, nota, dataNota) VALUES
(1, 1, 8.5, '2024-01-15'),
(1, 3, 9.0, '2024-01-15'),
(2, 2, 7.0, '2024-01-16'),
(3, 3, 8.0, '2024-01-17');

SELECT * FROM alunos;

SELECT * FROM cursos;

SELECT n.notaID, a.nome AS aluno, c.nome AS curso, n.nota, n.dataNota
FROM notas n
JOIN alunos a ON n.alunoID = a.alunoID
JOIN cursos c ON n.cursoID = c.cursoID;
