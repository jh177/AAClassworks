# == Schema Information
#
# Table name: questions
#
#  id      :bigint           not null, primary key
#  text    :string           not null
#  poll_id :integer          not null
#
class Question < ApplicationRecord
  validates :text, :poll_id, presence: true

  has_many :answerchoices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
end
