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


