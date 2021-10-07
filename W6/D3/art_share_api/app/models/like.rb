# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  liker_id      :integer          not null
#  likeable_type :string
#  likeable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord
  validates :liker_id, presence: true

  belongs_to :liker,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :User

  belongs_to :likeable, polymorphic: true
end
