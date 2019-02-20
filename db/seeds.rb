# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
#
#   create_table "users", force: :cascade do |t|
#     t.string "username"
#     t.boolean "isHost"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false

User.create(username: "rachel", isHost: true)
User.create(username: "lol", isHost: false)
User.create(username: "hi", isHost: false)
User.create(username: "bob", isHost: false)
User.create(username: "phoebe", isHost: false)

puts "users seeded"
#   create_table "games", force: :cascade do |t|
#     t.string "prompt"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

# when a user clicks "start game", a UUID will be generated
# I want to grab a random prompt from Caption.all, using
# any submitted caption as potential props

#Caption.all.sample?
Game.create(prompt: "getting tickled")

puts "games seeded"
# Game.create(prompt: "taking a bite of a food you know you'll hate")
# Game.create(prompt: "climbing a mountain")

#   create_table "user_games", force: :cascade do |t|
#     t.integer "user_id"
#     t.integer "game_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end
UserGame.create(user_id: 1, game_id: 1)
UserGame.create(user_id: 2, game_id: 1)
UserGame.create(user_id: 3, game_id: 1)
UserGame.create(user_id: 4, game_id: 1)
UserGame.create(user_id: 5, game_id: 1)
# UserGame.create(user_id: , game_id: )
puts "user games seeded"

#   create_table "captions", force: :cascade do |t|
#     t.string "text"
#     t.integer "user_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

Caption.create(text: "watching a scary movie", user_id: 2)
Caption.create(text: "meditating in a garden", user_id: 3)
Caption.create(text: "scuba diving", user_id: 4)
Caption.create(text: "walking on the moon", user_id: 5)

puts "captions seeded"

#   create_table "game_captions", force: :cascade do |t|
#     t.integer "caption_id"
#     t.integer "game_id"
#     t.integer "points"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end
GameCaption.create(caption_id: 1, game_id: 1)
GameCaption.create(caption_id: 2, game_id: 1)
GameCaption.create(caption_id: 3, game_id: 1)
GameCaption.create(caption_id: 4, game_id: 1)
#
puts "gameCaptions seeded"
#
