class Recipes::Production < Recipes::Base
  def create
    t.gsub_file "config/environments/production.rb", /(\# config.action_mailer.+)/i do |match|
      "#{match}\n  config.action_mailer.default_options = { from: ENV['DEFAULT_EMAIL_ADDRESS'] }\n"
    end
  end
end