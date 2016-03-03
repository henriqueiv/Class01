//
//  PokemonDetailViewController.swift
//  Class01
//
//  Created by Henrique Valcanaia on 3/2/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import AsyncImageView
import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemon:Pokemon!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pokemonImage: AsyncImageView!
    @IBOutlet weak var pokemonNumber: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonLevel: UILabel!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonHealth: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    @IBOutlet weak var pokemonSpAttack: UILabel!
    @IBOutlet weak var pokemonSpDefense: UILabel!
    @IBOutlet weak var pokemonSpeed: UILabel!
    
    override func viewDidLoad() {
        pokemonImage.imageURL = NSURL(string: pokemon.image)
        
        setData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setData() {
        pokemonName.text = "#\(pokemon.number)"
        pokemonLevel.text = "LVL: \(pokemon.number)"
        pokemonType1.text = pokemon.type2 == nil ? pokemon.type1 : "\(pokemon.type1), \(pokemon.type2)"
        pokemonHealth.text = "HLT: \(pokemon.status.health)"
        pokemonAttack.text = "ATK: \(pokemon.status.attack)"
        pokemonDefense.text = "DEF: \(pokemon.status.defense)"
        pokemonSpAttack.text = "SPATK: \(pokemon.status.spAttack)"
        pokemonSpDefense.text = "SPDEF: \(pokemon.status.spDefense)"
        pokemonSpeed.text = "SPD: \(pokemon.status.speed)"
    }
    
}

// MARK: - UITableViewDelegate
extension PokemonDetailViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Skills"
    }
    
}

// MARK: - UITableViewDataSource
extension PokemonDetailViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.skills.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SkillCell") as! SkillCell
        cell.configureCellWithSkill(pokemon.skills[indexPath.row])
        return cell
    }
    
}