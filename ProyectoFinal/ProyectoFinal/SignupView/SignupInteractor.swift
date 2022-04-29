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
    
    func checkUser(email: String) {
        remoteDatamanager?.externalCheckUser(email: email)
    }
    
    func addUser(email: String, password: String, name: String) {
        remoteDatamanager?.externalAddUser(email: email, password: password, name: name)
    }

}

extension SignupInteractor: SignupRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func remotePushCheckUser(userExist: Bool) {
        presenter?.interactorPushCheckUser(userExist: userExist)
    }
    
    func remotepushUserAdded(userAdded: UserAdded) {
        presenter?.interactorPushUserAdded(userAdded: userAdded)
    }
    
}
