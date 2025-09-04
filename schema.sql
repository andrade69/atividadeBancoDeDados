PRAGMA foreign_keys = ON;

c


CREATE TABLE evento (
id INTEGER PRIMARY KEY  AUTOINCREMENT,
nome TEXT NOT NULL, 
descricao TEXT,
local TEXT NOT NULL,
data TEXT NOT NULL
);


CREATE TABLE inscricao (
id INTEGER PRIMARY KEY AUTOINCREMENT,
data TEXT NOT NULL, 
status TEXT NOT NULL CHECK (status IN ('realizada','pendente')),
id_evento INTEGER NOT NULL,
id_participante INTEGER NOT NULL,
FOREIGN KEY (id_evento) REFERENCES evento(id) ,
FOREIGN KEY (id_participante) REFERENCES participante(id)

);


CREATE TABLE pagamento (
id INTEGER PRIMARY KEY AUTOINCREMENT ,
valor REAL NOT NULL,
data TEXT NOT NULL,
status TEXT NOT NULL CHECK (status IN ('pago', 'pendente')),
id_inscricao INTEGER NOT NULL, 
FOREIGN KEY (id_inscricao) REFERENCES inscricao(id) ON DELETE CASCADE
);

INSERT INTO participante(nome, email, telefone) VALUES 
('Leticia', 'exemploEmail1@gmail.com', '00000000000'),
('Gabriel', 'exemploEmail2@gmail.com', '11111111111'),
('José', 'exemploEmail3@gmail.com', '22222222222');

INSERT INTO evento(nome, descricao, local, data) VALUES
('EventoA', 'descricao do evento a', 'patos de minas', '2025-09-03'),
('EventoB', 'descricao do evento b', 'patos de minas', '2025-08-04');

INSERT INTO inscricao(data, status, id_evento, id_participante) VALUES
('2025-09-03', 'realizada', 1,1),
('2025-09-02', 'pendente', 1,2),
('2025-09-01', 'realizada', 2,2),
('2025-09-28', 'pendente', 2,3);

INSERT INTO pagamento(valor, data, status, id_inscricao) VALUES
(100, '2025-09-05', 'pago', 1),
(90, '2025-09-06', 'pendente', 2),
(80, '2025-09-07', 'pago', 3),
(70, '2025-09-08', 'pendente', 4);
