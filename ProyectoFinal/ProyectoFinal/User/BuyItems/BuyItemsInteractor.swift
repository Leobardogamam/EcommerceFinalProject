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
    
    func getCards() {
        localDatamanager?.getCards()
    }
    
}

extension BuyItemsInteractor: BuyItemsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension BuyItemsInteractor: BuyItemsLocalDataDataManagerOutputProtocol{
    
    func localDataManagerCallBackBuySave(saved: Bool) {
        presenter?.localDataManagerCallBackBuySave(saved: saved)
    }
    
    
    func returnLocalDataCreditCar(cards: [NSManagedObject]) {
        presenter?.returnLocalDataCreditCar(cards: cards)
    }
    
    
}
