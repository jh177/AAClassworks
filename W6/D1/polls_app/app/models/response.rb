# == Schema Information
#
# Table name: responses
#
#  id                :bigint           not null, primary key
#  user_id           :integer          not null
#  question_id       :integer          not null
#  answer_choices_id :integer          not null
#
class Response < ApplicationRecord
  validates :question_id, :user_id, :answer_choices_id, presence: true
  validates :answer_choices_id, uniqueness: {scope: [:user_id, :question_id]}

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choices_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
