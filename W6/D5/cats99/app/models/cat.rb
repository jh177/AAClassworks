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

  validates :birth_date, :name, :color, :sex, :description, presence: true, 
    inclusion: {in: CATCOLOR, message: "#{color} is not a valid color"},
    inclusion: {in: :sex, message: "M or F"}

  def age
    today = Time.now
    current_age = today.year - self.birth_date.year
  end

end
