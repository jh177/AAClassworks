PRAGMA foreign_keys = ON;

--replies - questions likes -- questions follows -- questions -- users
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);


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

  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
  FOREIGN KEY (parent_id) REFERENCES replies(id)
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
  ('How to code?', 'body...', 1),
  ('How to whiteboard?', 'body...', 2);


--replies - questions likes (user, question_id) -- questions follows (follower_id, quesiton_id)
INSERT INTO
  question_follows (follower_id, question_id)
VALUES
  (1, 1),
  (2, 1);

INSERT INTO
  question_likes (user, question_id)
VALUES
  (1, 1),
  (2, 2);

INSERT INTO
  replies (body, question_id, author_id, parent_id)
VALUES
  ('Go to aA!', 1, 3, NULL), -- 1
  ('Just do it', 1, 2, 1),
  ('Mike is so cool!', 1, 1, 1),
  ('aA is the best!', 1, 1, 2),
  ('aA is the best!', 1, 3, 1);



