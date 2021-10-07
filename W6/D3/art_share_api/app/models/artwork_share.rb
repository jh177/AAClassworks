# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :viewer_id, uniqueness: { 
    scope: :artwork_id,
    message: "No double shares per viewer"
  }

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

  belongs_

end
