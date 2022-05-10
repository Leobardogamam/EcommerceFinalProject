//
//  PerfilInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/2/22.
//  
//

import Foundation

class PerfilInteractor: PerfilInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: PerfilInteractorOutputProtocol?
    var localDatamanager: PerfilLocalDataManagerInputProtocol?
    var remoteDatamanager: PerfilRemoteDataManagerInputProtocol?

}

extension PerfilInteractor: PerfilRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
