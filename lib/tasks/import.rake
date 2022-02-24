require 'uri'

namespace :import do
  task pokemons: :environment do
    import = Import.create!(resource: "pokemons")
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=2000')
    body = JSON.parse(response.body)
    body["results"].each do |result|
      response2 = HTTParty.get(result["url"])
      body2 = JSON.parse(response2.body)
      if !Pokemon.exists?(name: result["name"])
        picture = body2["sprites"]["other"]["dream_world"]["front_default"]
        if picture.nil?
          picture = body2["sprites"]["front_default"]
        end
        if picture.nil?
          picture = body2["sprites"]["back_default"]
        end
        if picture.nil?
          picture = "http://cdn.onlinewebfonts.com/svg/img_137275.png"
        end
        response3 = HTTParty.get(body2["species"]["url"])
        body3 = JSON.parse(response3.body)
        description = body3["flavor_text_entries"].first["flavor_text"]
        pokemon = Pokemon.create!(
          name: result["name"],
          height: body2["height"],
          weight: body2["weight"],
          types: body2["types"].map {|x| x["type"]["name"]},
          description: description,
          attack_names: body2["moves"].map {|x| x["move"]["name"]}
        )
        downloaded_image = URI.open(picture)
        extension = picture.split('.').last
        pokemon.photo.attach(io: downloaded_image, filename: "#{pokemon.name}.#{extension}")
      end
    end
    import.touch
  end

  task attacks: :environment do
    import = Import.create!(resource: "attacks")
    response = HTTParty.get('https://pokeapi.co/api/v2/move?limit=1000')
    body = JSON.parse(response.body)
    body["results"].each do |result|
      response2 = HTTParty.get(result["url"])
      body2 = JSON.parse(response2.body)
      if !Attack.exists?(name: result["name"])
        power = body2["power"]
        accuracy = body2["accuracy"]
        if power.nil?
          power = 0
        end
        if accuracy.nil?
          accuracy = 0
        end
        attack = Attack.create!(
        name: result["name"],
        accuracy: accuracy,
        power: power
      )
      puts attack.name
      end
    end
    import.touch
  end

  task berries: :environment do
    import = Import.create!(resource: "berries")
    response = HTTParty.get('https://pokeapi.co/api/v2/berry?limit=5000')
    body = JSON.parse(response.body)
    body["results"].each do |result|
      if !Berry.exists?(name: result["name"])
        berry = Berry.create!(
        name: result["name"]
      )
      puts berry.name
      end
    end
    import.touch
  end
end