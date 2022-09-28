#Para gerar uma rake task: rails g task nome_namespace nome_task
namespace :dev do
  desc "Configura o ambiente de desenvolvimento" #descrição que aparece do lado da rake task
  task setup: :environment do
    if Rails.env.development?
      execute_task("Apagando banco de dados") {  %x(rails db:drop)  }# %x permite executarmos um comando no terminal 

      execute_task("Criando banco de dados") {  %x(rails db:create)  }

      execute_task("Rodando migrations") {  %x(rails db:migrate)  }

      execute_task("Populando banco de dados") {  %x(rails db:seed)  }
    else
      puts "Você não está no ambiente de desenvolvimento para rodar essa task."
    end
  end

  def execute_task start_msg, end_msg = "Concluído"
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
      spinner.auto_spin
      yield
      spinner.success("(#{end_msg})")
  end

end
