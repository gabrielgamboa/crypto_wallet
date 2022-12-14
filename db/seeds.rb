# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

coins = [
   {
      description: "Bitcoin",
      acronym: "BTC",
      url_image:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png"
   },
   {
      description: "Etherium",
      acronym: "ETH",
       url_image:"https://media.moneytimes.com.br/uploads/2022/03/ethereum-pexels.jpg"
   }

]


coins.each do |coin|
   Coin.find_or_create_by!(coin)
end


spinner.success("Moedas cadastradas com sucesso!") 