//
//  Skill.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import Gloss

class Skill: Decodable {
    
    var name = ""
    var type = ""
    var damageCategory = ""
    var power = 0
    var accuracy = 0
    var powerPoint = 0
    
    required init?(json: JSON) {
        name = ("name" <~~ json)!
        type = ("type" <~~ json)!
        damageCategory = ("damageCategory" <~~ json)!
        power = ("power" <~~ json)!
        accuracy = ("accuracy" <~~ json)!
        powerPoint = ("powerPoint" <~~ json)!
    }
    
}