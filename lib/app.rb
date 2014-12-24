# -*- encoding : utf-8 -*-
class App

  # class methods
  class << self

    def host
      if Rails.env.production?
        'pajamadeals.in'
      else
        'pajamadeals.dev'
      end
    end

    def domain
      host
    end

    def name
      'Pajamadeals'
    end

    def url
      "http://#{host}"
    end

    def logo
      'pajamadeals'
    end

    def sender_email
      'bhushanlodha@gmail.com'
    end

    def sender_password
      ENV['B_PASSWORD']
    end

    def root
      Pathname.new File.expand_path(File.dirname(__FILE__) + "../../")
    end

    def transaction_cost
      '10'
    end
  end

end
