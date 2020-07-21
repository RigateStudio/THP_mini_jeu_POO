require "pry"
#Création de la classe Player
class Player

  #sert à consulter, lire et modifier le nom et niv. de vie
  attr_accessor :name, :life_points

    #initialise un joueur
    def initialize (name)
      @name = name
      @life_points = 10
    end

    #affiche l'état de santé du Player
    def show_state
      puts "#{@name} a #{@life_points} points de vie."
    end

    #Fonction appliquant un certain nombre de degats / Affiche un message si le joueur decede, retourne le nombre de points de vie si le joueur est toujours vivant.
    def gets_damage (number)
      @life_points = @life_points - number.to_i
      if @life_points <= 0
        puts "#{@name} a mangé ses morts !"
      else return show_state
      end
    end

    #infliger des dégats
    def attacks (player)
      puts "#{@name} attaque #{player.name}"
      dice_roll = compute_damage
        player.life_points = player.life_points - dice_roll  #On déplace cette ligne là en avant dernier pour que le niveau de vie ne s'affiche pas directement, ce qui n'est pas demandé dans cette question
        # On aurait pu aussi utiliser player.gets_damage(dice_roll)
        puts "Il lui inflige #{dice_roll} points de dégats"
        #On a @name ici car c'est player1 qui lance la fonction (c'est à dire player1.attacks(x))
        #On a "player.name" car "player ne lance pas la fonction donc on met instance.name pour trouver la classe"
      end

    #sortir un chiffre au hasard entre 1 et 6
    def compute_damage
      return rand(1..6)
    end
  end


class HumanPlayer < Player #La Class HumanPlayer à comme instance Player
  attr_accessor :weapon_level

  #Crée une instance à partir de la Classe HumanPlayer. Name est une variable obligatoire de mon instance player
  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  #affiche l'état de santé du Player
  def show_state #Méthode d'instance. Si cétait un show_state.self ça serait une méthode de Class
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  #niveau de l'arme
  def compute_damage
    rand(1..6) * @weapon_level
  end

  #Pour trouver une arme. Si le niveau est supérieure à l'arme actuelle,
  def search_weapon
    weapon_found = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_found} !"
    if weapon_found > @weapon_level
      @weapon_level = weapon_found
      puts "Youhou, elle est bien meilleure que ton arme actuelle, tu la prends"
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle, tu la laisses."
    end
  end

  #randomisateur de health_pack
  def search_health_pack
    health_pack_found = rand(1..6)
    puts "health_pack_found"
    if health_pack_found == 1
      puts "Tu n'as rien trouvé Morray..."
    elsif health_pack_found == 6
      @life_points = @life_points + 80
      puts "Bravo, tu as trouvé un pack de +80 points de vie Morray."
    else
      @life_points = @life_points + 50 #suppression de la condition (2...5) pour éviter d'avoir trop rarement des 2. Le Elseif permet d'avoir soit 1, soit 6, soit on ajoute 50.
      puts "Bravo, tu as trouvé un pack de +50 points de vie Morray !"
    end
    if @life_points > 100
     @life_points = 100
     puts "Tu es trop gourmand Morray, tu as atteint le maximum de points de vie."
   else
    puts "Ta vie est désormais de #{@life_points} points de vie."
  end
end

end

#binding.pry
