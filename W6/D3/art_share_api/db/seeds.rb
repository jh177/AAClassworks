# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all
  # User.delete_all
  # Artwork.delete_all
  # ArtworkShare.delete_all


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

artwork1 = Artwork.create(title: 'Pipe Piper Artwork', artist_id: richard.id, image_url: 'jadsjhkdasjh' )
artwork2 = Artwork.create(title: 'Axe Cap Artwork', artist_id: bobby.id, image_url: 'khhkjrew' )
artwork3 = Artwork.create(title: 'AFC Richmond Artwork', artist_id: ted.id, image_url: 'uiweruyywe')
artwork4 = Artwork.create(title: 'K9 Artwork', artist_id: aji.id, image_url: 'iopwreorq')

share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: wendy.id)
share2 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: taylor.id)
share3 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: wendy.id)
share4 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: jared.id)
share5 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: monica.id)
share6 = ArtworkShare.create(artwork_id: artwork4.id, viewer_id: jian.id)
share7 = ArtworkShare.create(artwork_id: artwork4.id, viewer_id: lucki.id)
share8 = ArtworkShare.create(artwork_id: artwork4.id, viewer_id: richard.id)

comment1 = Comment.create(user_id: aji.id, artwork_id: artwork1.id, body: "Seems fast")
comment2 = Comment.create(user_id: bobby.id, artwork_id: artwork1.id, body: "Actually slow")
comment3 = Comment.create(user_id: jared.id, artwork_id: artwork3.id, body: "Fun show")
comment4 = Comment.create(user_id: aji.id, artwork_id: artwork4.id, body: "This is my work!")

end