PRAGMA foreign_keys = ON;

--replies - questions likes -- questions follows -- questions -- users

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  root_id INTEGER NOT NULL,

  FOREIGN KEY question_id REFERENCES questions(id),
  FOREIGN KEY author_id REFERENCES users(id),
  FOREIGN KEY root_id REFERENCES replies(id)
);


DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  -- user_id | question
  --  2      | q_id 1
  --  2      | q_id 2
  --  2      | q_id 3
  --  2      | q_id 4
  --  3      | q_id 1
  --  3      | q_id 3

  id INTEGER PRIMARY KEY,
  follower_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY follower_id REFERENCES users(id),
  FOREIGN KEY question_id REFERENCES questions(id)
);



DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY user REFERENCES users(id),
  FOREIGN KEY question_id REFERENCES questions(id)
);


DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY author_id REFERENCES users(id)
);


DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);


----------------------------

INSERT INTO
  users (fname, lname)
VALUES
  ('Steve', 'Smith'),
  ('Bobby', 'Axelrod'),
  ('Andy', 'Huang');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('How to code?', 'body...', (SELECT id FROM users WHERE fname = 'Steve' AND lname = 'Smith')),
  ('How to whiteboard?', 'body...', (SELECT id FROM users WHERE fname = 'Andy' AND lname = 'Huang'));


--replies - questions likes -- questions follows (follower_id, quesiton_id)
INSERT INTO
  question_follows (follower_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Steve' AND lname = 'Smith'), (SELECT id FROM questions WHERE title = 'How to code?') ),
  ((SELECT id FROM users WHERE fname = 'Andy' AND lname = 'Huang'), (SELECT id FROM questions WHERE title = 'How to whiteboard?') );


