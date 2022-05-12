//
//  LoginInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: LoginInteractorOutputProtocol?
    var localDatamanager: LoginLocalDataManagerInputProtocol?
    var remoteDatamanager: LoginRemoteDataManagerInputProtocol?
    
    func getUsers(email: String, password: String) {
        remoteDatamanager?.logingAuth(email: email, password: password)
    }
    
    func getUser() {
        remoteDatamanager?.externalGetUser()
    }
    


}

extension LoginInteractor: LoginRemoteDataManagerOutputProtocol {
   
    func isAvailable(isAvailable: Bool) {
        presenter?.isAvailable(isAvailable: isAvailable)
    }
    
    func returnUser(user: Users) {
        presenter?.returnUser(user: user)
    }
    
    func remotePushUserInteractor(users: [Users]) {
        presenter?.interactorPushUserPresenter(users: users)
    }
    
    
    // TODO: Implement use case methods
    
   
    

}

