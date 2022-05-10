//
//  AddCardsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class AddCardsInteractor: AddCardsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: AddCardsInteractorOutputProtocol?
    var localDatamanager: AddCardsLocalDataManagerInputProtocol?
    var remoteDatamanager: AddCardsRemoteDataManagerInputProtocol?

}

extension AddCardsInteractor: AddCardsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
