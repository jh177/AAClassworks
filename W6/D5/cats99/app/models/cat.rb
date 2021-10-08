# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  CATCOLOR = ['black', 'white', 'purple', 'yellow', 'grey', 'brown']

  validates :birth_date, :name, :color, :sex, :description, presence: true
  validates :color, inclusion: {in: CATCOLOR, message: "#is not a valid color"}
  validates :sex, inclusion: {in: %w(M F), message: "sex input is not valid"}

  def age
    today = Time.now
    current_age = today.year - self.birth_date.year
  end

end
