DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY author_id REFERENCES users(id)
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