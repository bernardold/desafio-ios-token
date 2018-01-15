//
//  GameListVC.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/9/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import SWRevealViewController

protocol GameListView {
    func updateView(_ viewModelArr: GameListViewModel)
}

class GameListVC: UIViewController {
    
    @IBOutlet weak var profileBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: GameListPresentation!
    var gameList = [GameViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSlideoutView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        presenter.requestGames()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let presenter = GameListPresenter()
        presenter.viewController = self
        self.presenter = presenter
    }

    func setupSlideoutView() {
        profileBtn.target = self.revealViewController()
        profileBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
    }
}

extension GameListVC: GameListView {
    
    func updateView(_ viewModelArr: GameListViewModel) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false;

        self.gameList = viewModelArr.games
        self.tableView.reloadData()

        activityIndicator.isHidden = true;
        activityIndicator.stopAnimating()
    }
}

extension GameListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? GameCell {
            let game = self.gameList[indexPath.row]
            cell.configureCell(game)
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameService.instance.games.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGame = GameService.instance.games[indexPath.row]
        GameService.instance.selectedGame = selectedGame
        
        performSegue(withIdentifier: GAME_DETAILS, sender: nil)
    }
}
