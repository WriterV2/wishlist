CREATE TABLE IF NOT EXISTS product
(
    id          INTEGER PRIMARY KEY NOT NULL, 
    name        TEXT                NOT NULL,
    description TEXT,                
    priority    INTEGER             
);

CREATE TABLE IF NOT EXISTS link
(
    id          INTEGER PRIMARY KEY NOT NULL, 
    pid         INTEGER             NOT NULL,
    url         TEXT                NOT NULL,
    name        TEXT,
    description TEXT,
    FOREIGN KEY (pid) REFERENCES product(id)
);

CREATE TABLE IF NOT EXISTS purchase
(
    id   INTEGER PRIMARY KEY NOT NULL, 
    pid  INTEGER             NOT NULL,
    lid  INTEGER             NOT NULL,
    date INTEGER             NOT NULL,
    FOREIGN KEY (pid) REFERENCES product(id),
    FOREIGN KEY (lid) REFERENCES link(id)
);

CREATE TABLE IF NOT EXISTS deadline
(
    id   INTEGER PRIMARY KEY NOT NULL,
    pid  INTEGER             NOT NULL,
    date INTEGER             NOT NULL,
    FOREIGN KEY (pid) REFERENCES product(id)
);
