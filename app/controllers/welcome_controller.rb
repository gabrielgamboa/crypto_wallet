class WelcomeController < ApplicationController
  def index
    @nome = params[:nome] ? params[:nome] : "SEM NOME"
  end
end
