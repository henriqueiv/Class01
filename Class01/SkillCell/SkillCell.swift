//
//  SkillCell.swift
//  Class01
//
//  Created by Henrique Valcanaia on 3/2/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import UIKit

class SkillCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var accuracy: UILabel!
    @IBOutlet weak var damageCategory: UILabel!
    @IBOutlet weak var powerPoint: UILabel!
    
    func configureCellWithSkill(skill:Skill) {
        name.text = skill.name
        type.text = skill.type
        power.text = "PWR: \(skill.power)"
        accuracy.text = "ACC: \(skill.accuracy)"
        damageCategory.text = "DMG CAT: \(skill.damageCategory)"
        powerPoint.text = "PP: \(skill.powerPoint)"
    }
    
    
}
