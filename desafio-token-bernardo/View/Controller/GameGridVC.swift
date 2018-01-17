//
//  GameGridVC.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/16/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import SWRevealViewController
import DeviceKit

protocol GameGridView {
    func updateView(_ viewModelArr: GameListViewModel)
    func showGameDetail()
    func startLoading()
    func stopLoading()
}

class GameGridVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var profileButton: UIBarButtonItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var gameList = [GameViewModel]()
    var presenter: GameGridPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlideoutView()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        presenter.requestGames()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let presenter = GameGridPresenter()
        presenter.viewController = self
        self.presenter = presenter
    }
    
    func setupSlideoutView() {
        profileButton.target = self.revealViewController()
        profileButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
    }
}

extension GameGridVC: GameGridView {
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
    
    func updateView(_ viewModelArr: GameListViewModel) {
        self.gameList = viewModelArr.games
        self.collectionView.reloadData()
    }
    
    func showGameDetail() {
        performSegue(withIdentifier: Constants.segue.fromCollectionToGameDetail, sender: nil)
    }
}

extension GameGridVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reusableCell.gameCollectionCell, for: indexPath) as? GameCollectionCell {
            let game = self.gameList[indexPath.row]
            cell.configureCell(game)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectGame(withIndex: indexPath)
    }

}

extension GameGridVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cols: CGFloat = 2
        let device = Device()
        var cellWidth: CGFloat
        var cellHeight: CGFloat
        
        if device.isPad {
            cellWidth = ((collectionView.bounds.width - 32.0) - ((cols - 1) * 10.0)) / cols
            cellHeight = cellWidth / 2.0
        } else {
            cellWidth = ((collectionView.bounds.width - 32.0) - ((cols - 1) * 10.0)) / cols
            cellHeight = cellWidth + 56.0
        }
        
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
