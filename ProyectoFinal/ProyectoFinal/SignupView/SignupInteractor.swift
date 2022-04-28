//
//  SignupInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation

class SignupInteractor: SignupInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: SignupInteractorOutputProtocol?
    var localDatamanager: SignupLocalDataManagerInputProtocol?
    var remoteDatamanager: SignupRemoteDataManagerInputProtocol?

}

extension SignupInteractor: SignupRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
