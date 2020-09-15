USE memo;

DROP TABLE IF EXISTS memo;

CREATE TABLE memo
(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  memo TEXT(21845)
);

INSERT INTO memo (memo) VALUES ("hoge");
INSERT INTO memo (memo) VALUES ("fuga");
INSERT INTO memo (memo) VALUES ("piyo");