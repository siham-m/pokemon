require 'open-uri'

read_image = URI.parse('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg').read
File.open('bulbizarre.png', 'wb') do |file|
file.write read_image
end
