//
//  Trainer.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import Gloss

class Trainer: Decodable {
    
    var name = ""
    var age = 0
    var photo = ""
    var town = ""
    var onHandPokemons = [Pokemon]()
    
    required init?(json: JSON) {
        name = ("name" <~~ json)!
        age = ("age" <~~ json)!
        photo = ("photo" <~~ json)!
        town = ("town" <~~ json)!
        onHandPokemons = ("onHandPokemons" <~~ json)!
    }

}