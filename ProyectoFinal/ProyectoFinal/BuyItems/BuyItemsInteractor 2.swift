//
//  BuyItemsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class BuyItemsInteractor: BuyItemsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: BuyItemsInteractorOutputProtocol?
    var localDatamanager: BuyItemsLocalDataManagerInputProtocol?
    var remoteDatamanager: BuyItemsRemoteDataManagerInputProtocol?

}

extension BuyItemsInteractor: BuyItemsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
