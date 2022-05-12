//
//  MyCardsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class MyCardsView: UIViewController {

    // MARK: Properties
    var presenter: MyCardsPresenterProtocol?
    var cards : [NSManagedObject]?
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func onPressGoToAddCard(_ sender: UIButton) {
        presenter?.showAddCards()
    }
    
}

extension MyCardsView: MyCardsViewProtocol {
    
    
    // TODO: implement view output methods
    
    func presenterPushCards(cards: [NSManagedObject]) {
        self.cards = cards
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension MyCardsView: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? MyCardCollectionViewCell)!
        
        let card = cards![indexPath.row]
        
        cell.cardImageView.backgroundColor = card.value(forKey: "color") as! UIColor
        
        
        
        return cell
    }
    
}
