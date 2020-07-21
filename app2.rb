require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "Appuyez sur entrée pour démarrer le jeu !"
gets

puts "Quel est le nom de votre joueur ?"
print "> "
user_name = gets.chomp
user = HumanPlayer.new(user_name)
puts "Votre personnage s'appelle #{user.name} le barbare"
bot1 = Player.new("Minus")
bot2 = Player.new("Cortex")

enemies = []
enemies << bot1 << bot2

puts "Bienvenue #{user_name} le barbare !"
puts "Un Minus et un Cortex sauvages sont apparus... En garde ⚔️ !"
puts "Que le combat commence ☠️ ☠️ "

while user.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0) do

  puts "Quelle action veux-tu effectuer ?"

  puts "_________________________________"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts " "
  puts "attaquer un joueur en vue :"
  puts "0 - Minus a #{bot1.life_points} points de vie"
  puts "1 - Cortex a #{bot2.life_points} points de vie"
  puts "_________________________________"

  puts "Choisissez votre prochain coup"
  print "> "
  user_choice = gets.chomp

  if user_choice == "a"
      #Le joueur trouve une arme
      user.search_weapon
    elsif user_choice =="s"
      #Le joueur trouve peut-être un pack de soin
      user.search_health_pack
      #Le joueur attaque Minus
    elsif user_choice == "0"
      user.attacks(bot1)
      if bot1.life_points < 0
        bot1.life_points = 0
      end
      #Le joueur attaque Cortex
    elsif user_choice == "1"
      user.attacks(bot2)
      if bot2.life_points < 0
        bot2.life_points = 0
      end
    end

    puts "Attention les ennemis attaquent !"

    i = 0
    enemies.each do
      if enemies[i].life_points > 0
        enemies[i].attacks(user)
      else
        puts "#{enemies[i].name} est mort!"
    i += 1  # i = i + 1
    end
    end

  puts "Voici l'état de chaque joueur :"
  user.show_state
  bot1.show_state
  bot2.show_state

end

if user.life_points <= 0
  puts "GAME OVER - VOUS AVEZ PERDU"
else
  puts "VOUS AVEZ GAGNÉ!!!"
end
