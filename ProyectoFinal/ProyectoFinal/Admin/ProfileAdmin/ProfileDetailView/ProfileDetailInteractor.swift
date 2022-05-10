//
//  ProfileDetailInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation

class ProfileDetailInteractor: ProfileDetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProfileDetailInteractorOutputProtocol?
    var localDatamanager: ProfileDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: ProfileDetailRemoteDataManagerInputProtocol?

}

extension ProfileDetailInteractor: ProfileDetailRemoteDataManagerOutputProtocol {
    func remotePushUsers(users: [Users]) {
        
    }
    
    // TODO: Implement use case methods
}
