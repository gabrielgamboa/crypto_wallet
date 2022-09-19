module ApplicationHelper
    def date_helper date_us
        date_us.strftime "%d/%m/%Y"
    end

    def application_name
        "CRYPTO WALLET APP"
    end

    def ambiente_rails
        if Rails.env.production?
            "Produção"
        elsif Rails.env.development?
            "Desenvolvimento"
        else 
            "Homologação"
        end
    end
end
