# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#  favorited :boolean
#
class Artwork < ApplicationRecord
  validates :title, uniqueness: { 
    scope: :artist_id,
    message: "No duplicate titles per artist"
  }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy
    
  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :likes, as: :likeable

  has_many :likers,
    through: :likes,
    source: :liker

end
