#Para gerar uma rake task: rails g task nome_namespace nome_task
namespace :dev do
  desc "Configura o ambiente de desenvolvimento" #descrição que aparece do lado da TASK
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed) # %x permite executarmos um comando no terminal 
  end

end
