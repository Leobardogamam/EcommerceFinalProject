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
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
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
        
        cell.cardImageView.backgroundColor = card.value(forKey: "color") as? UIColor
        cell.numberLabel.text = "\((card.value(forKey: "numserie") as? String)!)"
        cell.nameLabel.text = "\((card.value(forKey: "name") as? String)!)"
        cell.dateLabel.text = "\(card.value(forKey: "day")!)/\(card.value(forKey: "year")!)"
        
        if card.value(forKey: "cardType") as! String == "Visa"{
            cell.cardTypeImageView.image = UIImage(named: "Visa_Logo")
        }else if card.value(forKey: "cardType") as! String == "Mastercard"{
            cell.cardTypeImageView.image = UIImage(named: "logo-Mastercard")
        }else if card.value(forKey: "cardType") as! String == "American Express"{
            cell.cardTypeImageView.image = UIImage(named: "logo-American-Express")
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = cards![indexPath.row]
        let numSerie = card.value(forKey: "numserie") as? String
        
        
    }
    
}
