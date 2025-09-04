PRAGMA foreign_keys = ON;

CREATE TABLE participante (
id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
nome TEXT NOT NULL,
email TEXT NOT NULL UNIQUE,
telefone TEXT
);


CREATE TABLE evento (
id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
nome TEXT NOT NULL, 
descricao TEXT,
local TEXT NOT NULL,
data TEXT NOT NULL
);


CREATE TABLE inscricao (
id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT
data TEXT NOT NULL, 
status TEXT NOT NULL (status('realizada','pendente')),
FOREIGN KEY (id_evento) REFERENCES evento(id) ,
FOREIGN KEY (id_participante) REFERENCES participante(id)

);


CREATE TABLE pagamento (
id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
valor REAL NOT NULL,
data TEXT NOT NULL,
status TEXT NOT NULL (status ('pago', 'pendente'),
FOREIGN KEY (id_inscricao) REFERENCES isncricao(id) ON DELETE CASCADE
);

INSERT INTO participante(id, nome, email, telefone) VALUES 
(1, 'Leticia', 'exemploEmail1@gmail.com', '00000000000'),
(2, 'Gabriel', 'exemploEmail2@gmail.com', '11111111111'),
(3, 'José', 'exemploEmail3@gmail.com', '22222222222');

INSERT INTO evento(id, nome, descricao, local, data) VALUES
(1, 'EventoA', 'descricao do evento a', 'patos de minas', '2025-09-03'),
(2, 'EventoB', 'descricao do evento b', 'patos de minas', '2025-08-04');

INSERT INTO inscricao(id, data, status, id_evento, id_participante) VALUES
(1,'2025-09-03', 'realizada', 1,1),
(2,'2025-09-02', 'pendente', 1,2),
(3,'2025-09-01', 'realizada', 2,2),
(4,'2025-09-28', 'pendente', 2,3);

INSERT INTO pagamento(id, valor, data, status, id_inscricao) VALUES
(1, 100, '2025-09-05', 'pago', 1),
(2, 90, '2025-09-06', 'pendente', 2),
(3, 80, '2025-09-07', 'pago', 3),
(4, 70, '2025-09-08', 'pendente', 4);
