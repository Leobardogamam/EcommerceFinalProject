//
//  UsuarioInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/2/22.
//  
//

import Foundation

class UsuarioInteractor: UsuarioInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: UsuarioInteractorOutputProtocol?
    var localDatamanager: UsuarioLocalDataManagerInputProtocol?
    var remoteDatamanager: UsuarioRemoteDataManagerInputProtocol?

}

extension UsuarioInteractor: UsuarioRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
