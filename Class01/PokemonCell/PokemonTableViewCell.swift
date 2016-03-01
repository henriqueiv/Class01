//
//  PokemonTableViewCell.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import AsyncImageView

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var icon: AsyncImageView!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var defense: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    func configureCellWithPokemon(pokemon:Pokemon) {
        icon.imageURL = NSURL(string: pokemon.icon)!
        number.text = "#\(pokemon.number)"
        name.text = pokemon.name
        level.text = "Lvl: \(pokemon.level)"
        type.text = (pokemon.type2 == nil) ? pokemon.type1 : "\(pokemon.type1), \(pokemon.type2!)"
        health.text = "HLT: \(pokemon.status.health)"
        attack.text = "ATK: \(pokemon.status.attack)"
        defense.text = "DEF: \(pokemon.status.defense)"
        speed.text = "SPD: \(pokemon.status.speed)"
    }
    
}
