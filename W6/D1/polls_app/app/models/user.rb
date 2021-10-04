# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#
class User < ApplicationRecord
  validates :username, presence: true
  # validate :not_creator_respond

  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Poll

  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Response

  # private
  def not_creator_respond
    if self.question.poll.user_id == self.id
      errors[:user] << 'creator of the poll must not answer their own questions'
    end
  end
  

end
