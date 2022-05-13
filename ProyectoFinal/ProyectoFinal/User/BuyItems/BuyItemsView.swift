//
//  BuyItemsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class BuyItemsView: UIViewController {

    // MARK: Properties
    var presenter: BuyItemsPresenterProtocol?
    var cards : [NSManagedObject]?
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var collectionTarjet: UICollectionView!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func Pagar(_ sender: UIButton) {
        let alert = UIAlertController(title: "Se pagaran los productos", message: "Esta seguro de comprar", preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.presenter?.getAllShopingCar()
        }
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alert.addAction(cancelar)
        alert.addAction(aceptar)
        present(alert, animated: true)
    }
    
    
    @IBAction func onPressBuy(_ sender: Any) {
        presenter?.showAddCards()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension BuyItemsView: BuyItemsViewProtocol {
    // TODO: implement view output methods
    func sendPrice(price: Int) {
        lblPrice.text = "$" + String(price)
    }
}

extension BuyItemsView: UICollectionViewDelegate, UICollectionViewDataSource{
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
}
