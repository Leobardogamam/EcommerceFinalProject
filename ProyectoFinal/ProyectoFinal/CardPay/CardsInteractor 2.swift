//
//  CardsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class CardsInteractor: CardsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CardsInteractorOutputProtocol?
    var localDatamanager: CardsLocalDataManagerInputProtocol?
    var remoteDatamanager: CardsRemoteDataManagerInputProtocol?

}

extension CardsInteractor: CardsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
