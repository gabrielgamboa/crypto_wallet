#Para gerar uma rake task: rails g task nome_namespace nome_task
namespace :dev do
  desc "Configura o ambiente de desenvolvimento" #descrição que aparece do lado da rake task
  task setup: :environment do
    if Rails.env.development?
      execute_task("Apagando banco de dados...") {  %x(rails db:drop)  }# %x permite executarmos um comando no terminal 
      execute_task("Criando banco de dados...") {  %x(rails db:create)  }
      execute_task("Rodando migrations...") {  %x(rails db:migrate)  }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Você não está no ambiente de desenvolvimento para rodar essa task."
    end
  end

  desc "Cadastra moedas no banco de dados" 
  task add_coins: :environment do
    execute_task("Cadastrando moedas...") do 
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png",
          mining_type: MiningType.find_by(acronym: "PoW")
        },
        {
          description: "Etherium",
          acronym: "ETH",
          url_image:"https://media.moneytimes.com.br/uploads/2022/03/ethereum-pexels.jpg",
          mining_type: MiningType.all.sample
        }
      ]
  
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end 
    end
  end

  desc "Cadastra os tipos de mineração" 
  task add_mining_types: :environment do
    execute_task("Cadastrando tipos de mineração...") do
      mining_types = [
        {
          description: "Proof of Work",
          acronym: "PoW",
        },
        {
          description: "Proof of Stake",
          acronym: "PoS",
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC",
        },
      ]
  
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end 
    end
  end


  private

  def execute_task start_msg, end_msg = "Concluído"
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin
    yield
    spinner.success("(#{end_msg})")
  end

end
