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
    
    func getUsers() {
        remoteDatamanager?.externalGetUsers()
    }

}

extension LoginInteractor: LoginRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackData(with userList: [Users]) {
        presenter?.interactorPushDataPresenter(receivedData: userList)
    }
}
