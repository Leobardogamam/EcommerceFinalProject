//
//  MyCardsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class MyCardsInteractor: MyCardsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MyCardsInteractorOutputProtocol?
    var localDatamanager: MyCardsLocalDataManagerInputProtocol?
    var remoteDatamanager: MyCardsRemoteDataManagerInputProtocol?

}

extension MyCardsInteractor: MyCardsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
