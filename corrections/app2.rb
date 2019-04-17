require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "      ------------------------------------------------------------------"
puts"     |                      ╔╦╦╦═╦╗╔═╦═╦══╦═╗                           |
     |                      ║║║║╩╣╚╣═╣║║║║║╩╣                           |
     |                      ╚══╩═╩═╩═╩═╩╩╩╩═╝                           |
     |              Bienvenue sur 'ILS VEULENT TOUS MA POO'             |
     |          Le jeu comme fornite mais pas vraiment                  |
     |      T'as pas de thunes alors code ton propre jeu!!        |".colorize(:yellow)
puts"     --------------------------------------------------------------------".colorize(:red)

puts "C'est quoi ton petit nom ?".colorize(:green)
print ">".colorize(:yellow)
human_name = gets.chomp
     
#définition des joueurs
player = HumanPlayer.new("#{human_name}")
player1 = Player.new("José")
player2 = Player.new("Josianne")

#création de l'array d'ennemis
enemies = []
enemies << player1
enemies << player2


#Début de la partie :
puts "     VOICI L'ETAT DE CHAQUE JOUEUR    ".colorize(:yellow)

  puts player.show_state
  puts player1.show_state
  puts player2.show_state
puts 

puts "PASSONS A LA PHASE D'ATTAQUE:".colorize(:yellow)

  while player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
# Tant que moi et un des deux autres joueurs avons des points de vie, le jeu continue
# Le code qui suit laisse le choix au joueur de son action:
    print player.show_state
    puts "Quelle action veux-tu effectuer?".colorize(:green)
        puts
    puts"a - chercher une meilleur arme".colorize(:blue)
    puts"s - chercher des points de vies".colorize(:blue)
        puts
    puts"Attaquer un joueur?".colorize(:green)
    puts"1 - #{player1.show_state}".colorize(:blue)
    puts"2 - #{player2.show_state}".colorize(:blue)

      action = gets.chomp
#Les actions qui seront effectuées selon le choix du joueur:
    if action == "a"
      player.search_weapon 
      puts "______________________________________"
    elsif action == "s"
      player.search_health_pack
      puts "______________________________________"
    elsif action == "1"
      player.attacks(player1)
      player1.show_state
      puts "______________________________________"
        elsif action == "2"
      player.attacks(player2)
      player2.show_state
      puts "______________________________________"
    end

puts "                RIPOSTE                ".colorize(:green)
puts"****************************************"
  enemies.each do |enemy|
    if enemy.life_points > 0 #si l'ennemi a des points de vie il peut riposter
      enemy.attacks(player)
    else
            puts "YOU KILLED THIS BASTARD MOTHER FUCKER!!!
            _________                      _
            __------____/    ===  ========================
            |               ________________/
            |      ___--_/(_)             ^
            |___---
            ".colorize(:red) 
      end
    end

  end
puts "
    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼".colorize(:blue)
puts"    ███▀▀▀██┼███▀▀▀███┼███▀█▄█▀███┼██▀▀▀
    ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼█┼┼┼██┼██┼┼┼
    ██┼┼┼▄▄▄┼██▄▄▄▄▄██┼██┼┼┼▀┼┼┼██┼██▀▀▀
    ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██┼┼┼
    ███▄▄▄██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██▄▄▄".colorize(:red)
puts"    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼".colorize(:blue)
puts"    ███▀▀▀███┼▀███┼┼██▀┼██▀▀▀┼██▀▀▀▀██▄┼
    ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██┼┼┼┼██┼┼┼┼┼██┼
    ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██▀▀▀┼██▄▄▄▄▄▀▀┼
    ██┼┼┼┼┼██┼┼┼██┼┼█▀┼┼██┼┼┼┼██┼┼┼┼┼██┼
    ███▄▄▄███┼┼┼─▀█▀┼┼─┼██▄▄▄┼██┼┼┼┼┼██▄".colorize(:green)
puts"    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼".colorize(:blue)
  if player.life_points > player1.life_points && player.life_points > player2.life_points
    # si à la sortie de la boucle le joueur humain a plus de points que les robots il a gagné
    puts "_________ !!!! OVERKILL GOD LIKE!!!! _________".colorize(:yello)
  else
        puts "          TU AS PERDU!!! RENTRE CHEZ TOI TA MERE T'A FAIT DES GAUFFRES!!!".colorize(:yellow)
        puts"
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░▓████████████████████████▒░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░▓█████▓▒░░░░░░░░░░░░░░░▒██████▒░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░████▒░░░░░░░░░░░░░░░░░░░░░░░░░▓███▒░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░▒██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒██░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░▒██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░
        ░░░░░░░░░░░░░██▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒░░██░░░░░░░░░░░░░
        ░░░░░░░░░░░░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░░░░░░░░░░░
        ░░░░░░░░░░░░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░░░░░░░░░░░
        ░░░░░░░░░░░░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░░░░░░░░░░░
        ░░░░░░░░░░░░░██▒░██▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██▓░▒██░░░░░░░░░░░░
        ░░░░░░░░░░░░░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░██▒░██░░░░░▒▒▓███▒░░░░░░░▒███▓▒▒░░░░░██░▓██░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░██░██░░██████████▒░░░░░▓██████████░░██▒██░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░████░████████████░░░░░████████████░████░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░███░▒██████████░░░░░░░██████████▒░██▒░░░░░░░░░▒░░░░░░
        ░░░░░▒████░░░░░░░▓█▒░░█████████░░░░░░░░░█████████░░▒█▓░░░░░░▓████░░░░░
        ░░░░░██░▒██▒░░░░░██░░░░██████▓░░░░█░█░░░░███████░░░░██░░░░░███░░██░░░░
        ░░░░░██░░░██▓░░░░██░░░░░░▒▓▓░░░░▒██░██░░░░░▓▓▒░░░░░▒██░░░░███░░░██░░░░
        ░░░▓██▒░░░░████▓░░██░░░░░░░░░░░░███░███░░░░░░░░░░░░██░░█████░░░░▓██▒░░
        ░░██▓░░░░░░░░▒████████▓░░░░░░░░████░███▓░░░░░░░▒▓████████░░░░░░░░░███░
        ░░██▓▒▓███▓░░░░░░▓████████▓░░░░████░███▓░░░░▓████████▓░░░░░░████▓▓███░
        ░░░███████████▒░░░░░░███████░░░░██░░░██░░░░██████▓░░░░░░▓███████████░░
        ░░░░░░░░░░░░▓█████░░░░██▓▓░██░░░░░░░░░░░░░██░█▒██░░░▒█████▓░░░░░░░░░░░
        ░░░░░░░░░░░░░░░▒█████▒▒█▓█░███▓▓▒▒▒▓▒▒▓▓▓███▒███░▓█████░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░▒████▒▓█▒▒█░█▒█░█░█▓█▒█▓░█░█████▒░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░██░░██▓█▓█▓█▒█▒█▓█▓████░▓█▓░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░▓████▓░▓█▓█░█▒█░█░█▒█▒███▒░██████░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░▓█████░░██░░░▒█████▓█▓█████▒░░░██░▒█████▓░░░░░░░░░░░░░░
        ░░░░░░▒██████████▓░░░░░███░░░░░░░░░░░░░░░░░░░██▒░░░░░▓██████████▒░░░░░
        ░░░░░░██░░░▓▓▓░░░░░░▒██████▓░░░░░░░░░░░░░░░███████▒░░░░░░▓▓▒░░▒██░░░░░
        ░░░░░░▓██░░░░░░░░▓████▓░░░█████▒░░░░░░▒▓█████░░░▓████▓░░░░░░░▒██▓░░░░░
        ░░░░░░░░███░░░░████▒░░░░░░░░▓█████████████▒░░░░░░░░▒████░░░░███░░░░░░░
        ░░░░░░░░░██░░░██▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓██░░░██░░░░░░░░
        ░░░░░░░░░██▒▓██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒██▒▓██░░░░░░░░
        ░░░░░░░░░░████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░████░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
        ".colorize(:red)
  end