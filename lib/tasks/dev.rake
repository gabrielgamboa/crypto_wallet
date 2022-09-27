#Para gerar uma rake task: rails g task nome_namespace nome_task
namespace :dev do
  desc "Configura o ambiente de desenvolvimento" #descrição que aparece do lado da TASK
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando banco de dados")
      spinner.auto_spin
      puts %x(rails db:drop) # %x permite executarmos um comando no terminal 
      spinner.success("Concluído")

      spinner = TTY::Spinner.new("[:spinner] Criando banco de dados")
      spinner.auto_spin
      puts %x(rails db:create)
      spinner.success("Concluído")

      spinner = TTY::Spinner.new("[:spinner] Rodando migrations")
      spinner.auto_spin
      puts %x(rails db:migrate) 
      spinner.success("Concluído")

      spinner = TTY::Spinner.new("[:spinner] Populando banco de dados")
      spinner.auto_spin
      puts %x(rails db:seed)
      spinner.success("Concluído")
    else
      puts "Você não está no ambiente de desenvolvimento para rodar essa task."
    end
  end

end
