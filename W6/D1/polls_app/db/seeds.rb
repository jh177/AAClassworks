# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def rand_id
  rand(1..10)
end

ActiveRecord::Base.transaction do
  User.delete_all
  Poll.delete_all
  Question.delete_all
  AnswerChoice.delete_all
  Response.delete_all

richard = User.create(username: 'Richard')
bobby = User.create(username: 'Bobby')
wendy = User.create(username: 'Wendy')
taylor = User.create(username: 'Taylor')
jared = User.create(username: 'Jarad')
ted = User.create(username: 'Ted')
monica = User.create(username: 'Monica')
jian = User.create(username: 'Jian')
aji = User.create(username: 'Aji')
lucki = User.create(username: 'Lucki')

poll1 = Poll.create(title: 'Pipe Piper Poll', user_id: richard.id)
poll2 = Poll.create(title: 'Axe Cap Poll', user_id: bobby.id)
poll3 = Poll.create(title: 'AFC Richmond Poll', user_id: ted.id)
poll4 = Poll.create(title: 'K9 Poll', user_id: aji.id)

q1 = Question.create(text: 'middle-out?', poll_id: poll1.id)
q2 = Question.create(text: 'piper box?', poll_id: poll1.id)
q3 = Question.create(text: 'The Eads family?', poll_id: poll2.id)
q4 = Question.create(text: 'Alpha Cup?', poll_id: poll2.id)
q5 = Question.create(text: 'Roy Ken?', poll_id: poll3.id)
q6 = Question.create(text: 'Sam?', poll_id: poll3.id)
q7 = Question.create(text: 'Toys?', poll_id: poll4.id)
q8 = Question.create(text: 'Friends?', poll_id: poll4.id)

ac1 = AnswerChoice.create(text: 'excellent', question_id: q1.id)
ac2 = AnswerChoice.create(text: 'good', question_id: q1.id)
ac3 = AnswerChoice.create(text: 'okay', question_id: q2.id)
ac4 = AnswerChoice.create(text: 'terrible', question_id: q2.id)
ac5 = AnswerChoice.create(text: 'great', question_id: q3.id)
ac6 = AnswerChoice.create(text: 'evil', question_id: q3.id)
ac7 = AnswerChoice.create(text: 'easy', question_id: q4.id)
ac8 = AnswerChoice.create(text: 'hard', question_id: q4.id)
ac9 = AnswerChoice.create(text: 'player', question_id: q5.id)
ac10 = AnswerChoice.create(text: 'coach', question_id: q5.id)
ac11 = AnswerChoice.create(text: 'stay', question_id: q6.id)
ac12 = AnswerChoice.create(text: 'leave', question_id: q6.id)
ac13 = AnswerChoice.create(text: 'for share', question_id: q7.id)
ac14 = AnswerChoice.create(text: 'not for share', question_id: q7.id)
ac15 = AnswerChoice.create(text: 'lucki', question_id: q7.id)
ac16 = AnswerChoice.create(text: 'ruyi', question_id: q8.id)

Response.create(user_id: jared.id, question_id: q1.id, answer_choices_id: ac1.id)
Response.create(user_id: jared.id, question_id: q2.id, answer_choices_id: ac4.id)
Response.create(user_id: jared.id, question_id: q1.id, answer_choices_id: ac1.id)
Response.create(user_id: jared.id, question_id: q2.id, answer_choices_id: ac4.id)
Response.create(user_id: jian.id, question_id: q1.id, answer_choices_id: ac2.id)
Response.create(user_id: jian.id, question_id: q2.id, answer_choices_id: ac3.id)

Response.create(user_id: wendy.id, question_id: q3.id, answer_choices_id: ac6.id)
Response.create(user_id: wendy.id, question_id: q4.id, answer_choices_id: ac8.id)
Response.create(user_id: taylor.id, question_id: q3.id, answer_choices_id: ac6.id)
Response.create(user_id: taylor.id, question_id: q4.id, answer_choices_id: ac7.id)

Response.create(user_id: ted.id, question_id: q5.id, answer_choices_id: ac10.id)
Response.create(user_id: ted.id, question_id: q6.id, answer_choices_id: ac11.id)
Response.create(user_id: bobby.id, question_id: q5.id, answer_choices_id: ac9.id)
Response.create(user_id: bobby.id, question_id: q6.id, answer_choices_id: ac11.id)

Response.create(user_id: aji.id, question_id: q7.id, answer_choices_id: ac13.id)
Response.create(user_id: aji.id, question_id: q8.id, answer_choices_id: ac15.id)
Response.create(user_id: lucki.id, question_id: q7.id, answer_choices_id: ac13.id)
Response.create(user_id: lucki.id, question_id: q8.id, answer_choices_id: ac16.id)

end