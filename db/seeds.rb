User.destroy_all
Comic.destroy_all

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
    name: "Donald Porp",
    email: "porp@email.com",
    password: "abc123",
    password_confirmation: "abc123"
  }
])

admin.comics.create([
  {
    name: "Heated",
    image: File.open(File.join(Rails.root, '/app/assets/images/heated.png')),
    sketch: true
  },
  {
    name: "This is Awful",
    image: File.open(File.join(Rails.root, '/app/assets/images/this_is_awful.png')),
    sketch: true
  },
  {
    name: "Party Button",
    image: File.open(File.join(Rails.root, '/app/assets/images/party_button.png')),
    sketch: true
  },
  {
    name: "He's Software",
    image: File.open(File.join(Rails.root, '/app/assets/images/hes_software.png')),
    sketch: true
  },
  {
    name: "Milk's Most Courageous Cookie",
    image: File.open(File.join(Rails.root, '/app/assets/images/milks_most_courageous_cookie.png')),
    sketch: true
  },
  {
    name: "Save Yourself Son!",
    image: File.open(File.join(Rails.root, '/app/assets/images/save_yourself_son.png')),
    sketch: true
  },
  {
    name: "Not a Nobody",
    image: File.open(File.join(Rails.root, '/app/assets/images/not_a_nobody.jpg')),
    sketch: false
  },
  {
    name: "Cogito Ergo Sum…",
    image: File.open(File.join(Rails.root, '/app/assets/images/cogito_ergo_sum.jpg')),
    sketch: false
  },
  {
    name: "Dental Love",
    image: File.open(File.join(Rails.root, '/app/assets/images/dental_love.jpg')),
    sketch: false
  }
])

Favorite.create([
  { favorited: admin.comics[0], user: users[1] },
  { favorited: admin.comics[0], user: users[0] },
  { favorited: admin.comics[1], user: users[0] }
])

puts "#{User.count} users, #{Comic.count} comics, and #{Favorite.count} \
favorites created!"
