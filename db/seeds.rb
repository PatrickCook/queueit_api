# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(username: "admin", password_hash: "admin_password_hash")

admin_queue = admin.group_queues.create(name: "admin_queue")

admin_queue2 = admin.group_queues.create(name: "admin_2nd_queue")

admin_queue.songs.create(
  title: "Never Let Me Go",
  artist: "Attom",
  album_image_url: "https://i.scdn.co/image/a1fa07fbc51393d2f60ae631af9ec0f3797c84d7",
  spotify_uri: "spotify:track:0Pz5g9IWTlZbVCdxyER2Su"
)

admin_queue2.songs.create(
  title: "Staring at the Sun",
  artist: "Post Malone",
  album_image_url: "https://i.scdn.co/image/a1fa07fbc51393d2f60ae631af9ec0f3797c84d7",
  spotify_uri: "spotify:track:2leIuE4fdcJoNMSKu5Yr7a"
)
