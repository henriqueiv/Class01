//
//  ViewController.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import AsyncImageView
import SVProgressHUD
import UIKit

class TrainerViewController: UIViewController {
    
    var trainer:Trainer!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var trainerImage: AsyncImageView!
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var trainerAge: UILabel!
    @IBOutlet weak var trainerTown: UILabel!
    private let refreshControl = UIRefreshControl()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateScreen()
        setupTableView()
        tableView.reloadData()
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - Private helpers
    @objc private func loadData() {
        APIManager.sharedInstance.login("ash", password: "mistyS2") { [unowned self] (login:Bool, errorMessage:String, trainer:Trainer?) in
            if login {
                self.trainer = trainer!
                self.tableView.reloadData()
                if self.refreshControl.refreshing {
                    self.refreshControl.endRefreshing()
                }
            } else {
                SVProgressHUD.showErrorWithStatus(errorMessage, maskType: SVProgressHUDMaskType.Gradient)
            }
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.attributedTitle = NSAttributedString(string: NSLocalizedString("Pull to refresh", comment: ""))
        refreshControl.addTarget(self, action: "loadData", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    private func populateScreen() {
        trainerImage.imageURL = NSURL(string: trainer.photo)!
        trainerName.text = trainer.name
        trainerAge.text = "\(trainer.age)"
        trainerTown.text = trainer.town
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return .Slide
    }
    
}

// MARK: - UITableViewDelegate
extension TrainerViewController: UITableViewDelegate {
    
    //
    
}

// MARK: - UITableViewDataSource
extension TrainerViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainer.onHandPokemons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PokemonTableViewCell", forIndexPath: indexPath) as! PokemonTableViewCell
        cell.configureCellWithPokemon(trainer.onHandPokemons[indexPath.row])
        
        return cell
    }
    
}
