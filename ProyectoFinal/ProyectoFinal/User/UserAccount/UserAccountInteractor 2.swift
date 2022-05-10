//
//  UserAccountInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class UserAccountInteractor: UserAccountInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: UserAccountInteractorOutputProtocol?
    var localDatamanager: UserAccountLocalDataManagerInputProtocol?
    var remoteDatamanager: UserAccountRemoteDataManagerInputProtocol?

}

extension UserAccountInteractor: UserAccountRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
