//
//  AddCardsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class AddCardsInteractor: AddCardsInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: AddCardsInteractorOutputProtocol?
    var localDatamanager: AddCardsLocalDataManagerInputProtocol?
    var remoteDatamanager: AddCardsRemoteDataManagerInputProtocol?

    func saveCard(cvv: Int, day: Int, year: Int, idUser: Int, numSerie: String, name: String, color: UIColor, cardType: String) {
        localDatamanager?.localSaveCard(cvv: cvv, day: day, year: year, idUser: idUser, numSerie: numSerie, name: name, color: color, cardType: cardType)
    }
    func getCards() {
        localDatamanager?.getCards()
    }

}

extension AddCardsInteractor : AddCardsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension AddCardsInteractor : AddCardsLocalDataManagerOutputProtocol{
   
    func localDataManagerCallBackCardAdded(added: Bool) {
        presenter?.interactorPushCardAdded(added: added)
    }
    
    func localDataManagerCallBackCards(cards: [NSManagedObject]) {
        presenter?.interactorPushCards(cards: cards)
    }
    
    
}
