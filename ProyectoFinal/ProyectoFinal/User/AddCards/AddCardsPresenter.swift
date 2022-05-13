//
//  AddCardsPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class AddCardsPresenter  {
    
    // MARK: Properties
    weak var view: AddCardsViewProtocol?
    var interactor: AddCardsInteractorInputProtocol?
    var wireFrame: AddCardsWireFrameProtocol?
    
}

extension AddCardsPresenter: AddCardsPresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func saveCard(cvv: Int, day: Int, year: Int, idUser: Int, numSerie: String, name: String, color: UIColor, cardType : String) {
        interactor?.saveCard(cvv: cvv, day: day, year: year, idUser: idUser, numSerie: numSerie, name: name, color: color, cardType: cardType)
    }
    
    func showCardView() {
        wireFrame?.presentNewViewCards(from: view!)
    }
    
    func getCards() {
        interactor?.getCards()
    }
    

}

extension AddCardsPresenter: AddCardsInteractorOutputProtocol {
    
    
    // TODO: implement interactor output methods
    
    func interactorPushCardAdded(added: Bool) {
        view?.presenterPushCardAdded(added: added)
    }
    
    func interactorPushCards(cards: [NSManagedObject]) {
        view?.presenterPushCards(cards: cards)
    }
    
}
