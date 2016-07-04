User.destroy_all

admin = User.create({
  name: "ezRAez",
  email: "ezRAez10@gmail.com",
  password: "abc123",
  password_confirmation: "abc123",
  admin: true
})

users = User.create([
  {
    name: "Dick Schiller",
    email: "dickschiller@uselesscomix.com",
    password: "abc123",
    password_confirmation: "abc123"
  },
  {
    name: "Porp Donald Porp",
    email: "porp@email.com",
    password: "abc123",
    password_confirmation: "abc123"
  }
])

admin.comics.create([
  { name: "Heated", uri: "http://www.uselesscomix.com/wp-content/uploads/2013/05/2013-05-24-Heated.png" },
  { name: "He's Software", uri: "http://www.uselesscomix.com/wp-content/uploads/2013/04/2013-04-29-Hes-Software.png" }
])

Favorite.create([
  { favorited: admin.comics[0], user: users[1] },
  { favorited: admin.comics[0], user: users[0] },
  { favorited: admin.comics[1], user: users[0] }
])

puts "#{User.count} users, #{Comic.count} comics, and #{Favorite.count} \
favorites created!"
