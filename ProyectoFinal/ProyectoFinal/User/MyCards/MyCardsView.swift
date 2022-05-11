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
        
        
    }
}
