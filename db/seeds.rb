# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
	email: "p@p",
	password: "aaaaaa"
)

Genre.create!(
		name: "ジャンル"
)

3.times do |i|
	Item.create!(
		genre_id: "1",
		name: "おかし#{i+1}",
		description: "説明文#{i+1}",
		price: "#{i+1}00"
	)
end