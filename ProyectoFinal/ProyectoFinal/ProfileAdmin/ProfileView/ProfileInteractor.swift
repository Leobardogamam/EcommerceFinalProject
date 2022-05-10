//
//  ProfileInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/8/22.
//  
//

import Foundation

class ProfileInteractor: ProfileInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProfileInteractorOutputProtocol?
    var localDatamanager: ProfileLocalDataManagerInputProtocol?
    var remoteDatamanager: ProfileRemoteDataManagerInputProtocol?

}

extension ProfileInteractor: ProfileRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
