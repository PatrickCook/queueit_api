admin = User.create(
  email: "admin",
  name: "John Doe",
  password: "password",
  password_confirmation: "password"
)

pcook = User.create(
  email: "pcook",
  name: "Patrick Cook",
  password: "password",
  password_confirmation: "password"
)

# Create admin queue and join the queue
admin_queue = Group.create(name: "admin_queue")
admin.owned_queues << admin_queue
admin_queue.members << admin

# Create pcook queue and join the queue
pcook_queue = Group.create(name: "pcook_queue")
pcook.owned_queues << pcook_queue
pcook_queue.members << pcook

# Join the other queues
admin_queue.members << pcook
pcook_queue.members << admin

admin_queue.songs.create(
  title: "Never Let Me Go",
  artist: "Attom",
  album_image_url: "https://i.scdn.co/image/a1fa07fbc51393d2f60ae631af9ec0f3797c84d7",
  spotify_uri: "spotify:track:0Pz5g9IWTlZbVCdxyER2Su"
)

pcook_queue.songs.create(
  title: "Staring at the Sun",
  artist: "Post Malone",
  album_image_url: "https://i.scdn.co/image/a1fa07fbc51393d2f60ae631af9ec0f3797c84d7",
  spotify_uri: "spotify:track:2leIuE4fdcJoNMSKu5Yr7a"
)
