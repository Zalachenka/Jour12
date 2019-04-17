require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def game

player1 = Player.new("José")
player2 = Player.new("Josianne")

#Lance le titre du jeu

puts "------------------------------------------------".colorize(:red)
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |".colorize(:red)
puts "|Le but du jeu est d'être le dernier survivant !|".colorize(:red)
puts "------------------------------------------------".colorize(:red)

puts "VOICI L'ETAT DE CHAQUE JOUEUR:".colorize(:green)
    puts player1.show_state
    puts player2.show_state
puts

#__ Afficher l'état de la vie en début de partie

puts "PASSONS A LA PHASE D'ATTAQUE:".colorize(:green)
    while player1.life_points > 0 && player2.life_points >0
        print player1.attacks(player2)
        puts player2.show_state
            break if player2.life_points.to_i <= 0 
        print player2.attacks(player1)
        puts player1.show_state
    end
    
end

puts game