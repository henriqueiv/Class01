//
//  Pokemon.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import Gloss

class Pokemon: Decodable {
    
    var number = 0
    var name = ""
    var icon = ""
    var image = ""
    var level = 0
    var type1 = ""
    var type2:String?
    var status:Status!
    var skills = [Skill]()
    
    required init?(json: JSON) {
        number = ("number" <~~ json)!
        name = ("name" <~~ json)!
        icon = ("icon" <~~ json)!
        image = ("image" <~~ json)!
        level = ("level" <~~ json)!
        type1 = ("type1" <~~ json)!
        type2 = ("type2" <~~ json)
        status = Status(json: json["status"] as! JSON)!
        skills = ("skills" <~~ json)!
    }
    
}