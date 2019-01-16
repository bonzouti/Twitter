require 'twitter'
require 'dotenv'# Appelle la gem Dotenv
require 'pry'
require_relative 'journalists_users.rb'

# Ceci appelle le fichier .env grâce à la gem Dotenv, et importe toutes les données enregistrées dans un hash ENV
Dotenv.load'../.env'

# Quelques lignes qui appellent les clés d'API de ton fichier .env
def login_twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
 
  end
end

 # Client qui permet de se logguer avec les fonctions de streaming
def login_streaming
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  client 
end
  #mon premier tweet
#login_twitter.update("Mon robot fonctionne parfaitement")

# Fonction qui sélection 5 journalites au hasard pour leur envoyer un tweet
# def bonjour
#   journalists.sample(5).each do |i|
#   login_twitter.update("Bonjour #{i}! Félicitations pour votre travail,@the_hackin_pro #bonjour_monde")
#   end 
# end

# #Fonction qui affiche les 20 tweets récents contenant le hashtag #bonjour_monde
# def likez_bonjour
#      login_twitter.search("#bonjour_monde", result_type: "recent").take(2).each do |tweet|
#      login_twitter.fav tweet
#      end

#  end
# likez_bonjour

#Fonction qui va follower 5 follower
def follow_user
  login_twitter.search("#Macron", result_type: "recent").take(5).each do |tweet| 
    puts "Youpi"
  login_twitter.follow(tweet.user)

  end 
end
follow_user
 

# Fonction qui surveille le hashtag #bonjour_monde en temps réel et qui like automatiquement les tweets
# def stream
#   login_streaming.filter(track: "#Macron") do |tweet| puts "il l'a fait !!!"
#     if tweet.is_a?(Twitter::Tweet)
#       login_twitter.fav(tweet)
#     end
#   end
  
# end
# stream 