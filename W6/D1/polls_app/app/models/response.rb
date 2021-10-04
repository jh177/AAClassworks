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
  # validates :answer_choices_id, uniqueness: {scope: [:user_id, :question_id]}
  validate :not_duplicate_response
  validate :not_creator_respond


  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choices_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice, source: :question

  def sibling_responses
    responses = self.question.responses
    responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    self.sibling_responses.exists?(user_id: self.user_id)
  end

  private
  def not_duplicate_response
    if self.respondent_already_answered?
      errors[:respondent] << 'respondent has previously answered this question'
    end
  end

  def not_creator_respond
    if self.question.poll.user_id == self.user_id
      errors[:user] << 'creator of the poll must not answer their own questions'
    end
  end



end
