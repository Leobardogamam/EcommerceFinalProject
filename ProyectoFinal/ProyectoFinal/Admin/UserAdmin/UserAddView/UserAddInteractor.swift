//
//  UserAddInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

class UserAddInteractor: UserAddInteractorInputProtocol {
   
  
    // MARK: Properties
    weak var presenter: UserAddInteractorOutputProtocol?
    var localDatamanager: UserAddLocalDataManagerInputProtocol?
    var remoteDatamanager: UserAddRemoteDataManagerInputProtocol?
    
    func checkUser(email: String) {
        remoteDatamanager?.externalCheckUser(email: email)
    }
    
    func addImage(avatarImage: UIImage) {
        remoteDatamanager?.externalAddImage(avatarImage: avatarImage)
    }
    
    func addUser(name: String, email: String, password: String, avatar: String) {
        remoteDatamanager?.externalAddUser(name: name, email: email, password: password, avatar: avatar)
    }
    
}

extension UserAddInteractor: UserAddRemoteDataManagerOutputProtocol {
   
    // TODO: Implement use case methods
    
    func remotePushCheckUser(userExist: Bool) {
        presenter?.interactorPushCheckUser(userExist: userExist)
    }
    
    func remotePushImageAdded(imageAdded: String) {
        presenter?.interactorPushImageAdded(imageAdded: imageAdded)
    }
    
    func remotePushUserAdded(added: Bool) {
        presenter?.interactorPushUserAdded(added: added)
    }
    
 
  
}
