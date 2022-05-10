//
//  DeleteEditCardsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class DeleteEditCardsInteractor: DeleteEditCardsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DeleteEditCardsInteractorOutputProtocol?
    var localDatamanager: DeleteEditCardsLocalDataManagerInputProtocol?
    var remoteDatamanager: DeleteEditCardsRemoteDataManagerInputProtocol?

}

extension DeleteEditCardsInteractor: DeleteEditCardsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
