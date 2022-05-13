//
//  DeleteEditCardsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class DeleteEditCardsView: UIViewController {

    // MARK: Properties
    var presenter: DeleteEditCardsPresenterProtocol?
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var numSerieLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cardTypeImageView: UIImageView!
    var cards : [NSManagedObject]?
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func editPressed(_ sender: Any) {
        presenter?.showEditCardView(numSerie: (cards![0].value(forKey: "numserie") as? String)!)
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        let alert = UIAlertController(title: "Eliminar", message: "¿Estas seguro que deseas eliminar esta tarjeta?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Si", style: .default) { [self] UIAlertAction in
            presenter?.deleteCard(numSerie: (self.cards![0].value(forKey: "numserie") as? String)!)
            self.dismiss(animated: true)
            
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
        

        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    
}

extension DeleteEditCardsView: DeleteEditCardsViewProtocol {
    
    
    // TODO: implement view output methods
    
    func presenterPushCard(card: [NSManagedObject]) {
        self.cards = card
        
        DispatchQueue.main.async {
            
            let cards = self.cards![0]
            self.numSerieLabel.text = "\((cards.value(forKey: "numserie") as? String)!)"
            self.nameLabel.text = "\((cards.value(forKey: "name") as? String)!)"
            self.dateLabel.text = "\(cards.value(forKey: "day")!)/\(cards.value(forKey: "year")!)"
            self.cardImageView.backgroundColor = cards.value(forKey: "color") as? UIColor
            
            if cards.value(forKey: "cardType") as! String == "Visa"{
                self.cardTypeImageView.image = UIImage(named: "Visa_Logo")
            }else if cards.value(forKey: "cardType") as! String == "Mastercard"{
                self.cardTypeImageView.image = UIImage(named: "logo-Mastercard")
            }else if cards.value(forKey: "cardType") as! String == "American Express"{
                self.cardTypeImageView.image = UIImage(named: "logo-American-Express")
            }
        }
    }
    
    
}
