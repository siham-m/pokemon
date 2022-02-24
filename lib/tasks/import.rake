namespace :import do
  task pokemons: :environment do
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
        pokemon = Pokemon.create!(
        name: result["name"],
        height: body2["height"],
        weight: body2["weight"],
        picture: picture,
        attack_names: body2["moves"].map {|x| x["move"]["name"]}
      )
      puts pokemon.name
      end
    end
  end

  task attacks: :environment do
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
  end
end