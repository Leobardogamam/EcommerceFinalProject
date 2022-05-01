//
//  SignupInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation
import UIKit

class SignupInteractor: SignupInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: SignupInteractorOutputProtocol?
    var localDatamanager: SignupLocalDataManagerInputProtocol?
    var remoteDatamanager: SignupRemoteDataManagerInputProtocol?
    
    func checkUser(email: String) {
        remoteDatamanager?.externalCheckUser(email: email)
    }
    
    func addImage(avatarImage: UIImage) {
        remoteDatamanager?.externalAddImage(avatarImage: avatarImage)
    }
    
    func addUser(email: String, password: String, name: String, avatar: String) {
        remoteDatamanager?.externalAddUser(email: email, password: password, name: name, avatar: avatar)
    }

}

extension SignupInteractor: SignupRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func remotePushCheckUser(userExist: Bool) {
        presenter?.interactorPushCheckUser(userExist: userExist)
    }
    
    func remotepushImageAdded(imageAdded: String) {
        presenter?.interactorPushImageAdded(imageAdded: imageAdded)
    }
    
    func remotepushUserAdded(userAdded: UserAdded) {
        presenter?.interactorPushUserAdded(userAdded: userAdded)
    }
    
}
