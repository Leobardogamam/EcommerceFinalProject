//
//  UserInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/7/22.
//  
//

import Foundation

class UserInteractor: UserInteractorInputProtocol {
    

    // MARK: Properties
    weak var presenter: UserInteractorOutputProtocol?
    var localDatamanager: UserLocalDataManagerInputProtocol?
    var remoteDatamanager: UserRemoteDataManagerInputProtocol?
    
    func getUsers() {
        remoteDatamanager?.externalGetUsers()
    }
    

}

extension UserInteractor: UserRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    
    func remoteDataManagerCallBackUsers(with users: [Users]) {
        presenter?.interactorPushUsersPresenter(receivedUsers: users)
    }
}
