module ApplicationHelper
    def date_helper date_us
        date_us.strftime "%d/%m/%Y"
    end

    def application_name
        "CRYPTO WALLET APP"
    end
end
