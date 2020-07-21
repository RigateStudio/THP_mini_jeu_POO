require 'bundler'
require "pry"
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts"---------------------------"

#création de joueur
player1 = Player.new ("Mario")
player2 = Player.new ("Luigi")

    #message
    puts "C'est l'heure du duel !"
    puts "A ma droite : #{player1.name}"
    puts "A ma gauche : #{player2.name}"

    puts"---------------------------"
    #renseigner le niveau de vie de chaque joueur
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state

    #insère une ligne vide pour aérer le code
    puts " "

      #Les joueurs continuent d'attaquer tant qu'ils ont de la vie
      while player1.life_points > 0 || player2.life_points > 0 do
        player1.attacks(player2)
        if player2.life_points <= 0
          break
        end
        player2.attacks(player1)
        if player1.life_points <= 0
          break
        end

    #insère une ligne vide pour aérer le code
    puts" "

    #renseigner le niveau de vie de chaque joueur
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state

    #insère une ligne vide pour aérer le code
    puts" "
  end

  puts " "
  puts "FINISH HIMMMMM"
  puts " "

  puts "A la fin de ce combat, voici les points de vie de chacun"
  player1.show_state
  player2.show_state
    if player1.life_points <= 0 #permet de voir si le joueur est mort ( <= 0 ) ou non ( + de 0 )
      puts "#{player1.name} s'est fait déglinguer"
    else
      puts "#{player2.name} l'a eu dans le fut Lulu"
    end

#binding.pry
