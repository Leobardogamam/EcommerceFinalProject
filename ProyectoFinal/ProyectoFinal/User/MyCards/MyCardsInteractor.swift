//
//  MyCardsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData

class MyCardsInteractor: MyCardsInteractorInputProtocol {
   

    // MARK: Properties
    weak var presenter: MyCardsInteractorOutputProtocol?
    var localDatamanager: MyCardsLocalDataManagerInputProtocol?
    var remoteDatamanager: MyCardsRemoteDataManagerInputProtocol?
    
    func getCards() {
        localDatamanager?.localGetCards()
    }
    

}

extension MyCardsInteractor: MyCardsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension MyCardsInteractor : MyCardsLocalDataManagerOutputProtocol{
    func localDataManagerCallBackCards(cards: [NSManagedObject]) {
        presenter?.interactorPushCards(cards: cards)
    }
    
    
}
