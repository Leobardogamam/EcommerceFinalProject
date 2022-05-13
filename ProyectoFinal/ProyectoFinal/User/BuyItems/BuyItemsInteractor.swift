//
//  BuyItemsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData

class BuyItemsInteractor: BuyItemsInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: BuyItemsInteractorOutputProtocol?
    var localDatamanager: BuyItemsLocalDataManagerInputProtocol?
    var remoteDatamanager: BuyItemsRemoteDataManagerInputProtocol?

    
    func getAllShopingCar() {
        localDatamanager?.getAllShopingCar()
    }
    
    func getAllCardByPerson() {
        localDatamanager?.getAllCardByPerson()
    }
    
}

extension BuyItemsInteractor: BuyItemsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension BuyItemsInteractor: BuyItemsLocalDataDataManagerOutputProtocol{
    func presenterPushCards(cards: [NSManagedObject]) {
        presenter!.presenterPushCards(cards: cards)
    }
    
    
}
