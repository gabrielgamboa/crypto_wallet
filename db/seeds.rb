# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cadastrando moedas"

Coin.create!(
   description: "Bitcoin",
   acronym: "BTC",
   url_image:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png"
)

Coin.create!(
    description: "Etherium",
    acronym: "ETH",
    url_image:"https://media.moneytimes.com.br/uploads/2022/03/ethereum-pexels.jpg"
 )


puts "Moedas cadastradas com sucesso!"