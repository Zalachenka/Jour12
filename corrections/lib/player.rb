# require 'pry'




class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
        @life_points = 10   
        
        
    end
    

# Définition des instances 

  def show_state
    @life_points <= 0 ? "#{name} a été tué ! Points de vie: #{@life_points}" : "=> Il reste #{life_points} point à #{name}."
    
  end

#Si les points de vies sont inférieurs ou égal à 0 => "nom" a été tué, sinon Il reste tant de points à "nom"

  def gets_damage(dice)
    @life_points = @life_points - dice
  end
#Récupération de la variable damage 

  def attacks(ennemi)
    dice = compute_damage
    ennemi.gets_damage(dice)
    puts "#{name} attaque #{ennemi.name}."
        puts "Il lui inflige #{dice} points de dommages."
        return dice
  end
#Le dé est égal à un chiffre entre 1 et 6 // L'ennemi perd ce nombre en points de vie 

  def compute_damage
     return rand(1..6)
  end
end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    @name = name
    @life_points = 100
  end
#_______________________________

  def show_state
    puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end
#__________________________________

  def compute_damage
    rand(1..6) * @weapon_level    
  end
#___________________________________

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}."
      if new_weapon > @weapon_level
        @weapon_level = new_weapon
        puts "Youhou, tu as maintenant une arme de niveau #{@weapon_level}!"
      else 
        puts "M@****$; elle pue la crotte, tu la laisses."
      end
  end

#New_weapon est égal à un chiffre entre 1 et 6, s'il est supérieur à la valeur de @weapon_level on le garde 
#(et la valeur du dé devient la valeur de @weapon_level) et sinon on la laisse

  def search_health_pack
    health_pack = rand(1..6)
      if health_pack === 1 #si le dé est égal à 1, tu ne trouves rien
        puts "c'est un flop, tu n'as rien trouvé"
      elsif health_pack >= 2 && health_pack <= 5 && @life_points < 51 
        @life_points += 50
        puts "Bien ouej, tu gagnes 50 points de vie => Points de vie : #{@life_points}"
#si le dé est entre 2 et 5 et que tes points de vie sont supérieurs à 51 (dépassent 100), ils se bloquent à 100
      elsif health_pack >= 2 && health_pack <= 5 && @life_points >= 50 
        @life_points = 100
        puts "Bien ouej, tu gages 50 points de vie => Points de vie: #{@life_points}"
#si le dé est entre 2 et 5 et que tes points de vie sont inférieurs ou égaux à 50, on les additionne ensemble 
      elsif health_pack === 6 && @life_points > 21
        @life_points = 100
        puts "Champion !! Tu as trouvé 80 points de vie =D => Points de vie: #{@life_points}"
#si le dé est égal à 6 et que tes points de vie sont supérieurs à 21 (dépassent 100), ils se bloquent à 100
      else
        @life_points += 80
        puts "Champion !! Tu as trouvé 80 points de vie =D => Points de vie: #{@life_points}"
#si le dé est égal à 6 et que tes points de vie sont inférieurs ou égaux à 20, tu additionne 80
      end         
  end
end

# binding.pry