//
//  UserAddPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

class UserAddPresenter  {
    
    // MARK: Properties
    weak var view: UserAddViewProtocol?
    var interactor: UserAddInteractorInputProtocol?
    var wireFrame: UserAddWireFrameProtocol?
    
}

extension UserAddPresenter: UserAddPresenterProtocol {
   
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func checkUser(email : String) {
        interactor?.checkUser(email: email)
    }
    
    func addImage(avatarImage: UIImage) {
        interactor?.addImage(avatarImage: avatarImage)
    }
    
    func addUser(name : String, email : String, password : String, avatar : String) {
        interactor?.addUser(name: name, email: email, password: password, avatar: avatar)
    }
    
    func showUserView() {
        wireFrame?.presentNewViewUser(from: view!)
    }
    
   
  
}

extension UserAddPresenter: UserAddInteractorOutputProtocol {
  

    // TODO: implement interactor output methods
    
    func interactorPushCheckUser(userExist: Bool) {
        view?.presenterPushCheckUser(userExist: userExist)
    }
    
    func interactorPushImageAdded(imageAdded: String) {
        view?.presenterPushImageAdded(imageAdded: imageAdded)
    }
    
    func interactorPushUserAdded(added: Bool) {
        view?.presenterPushUserAdded(added: added)
    }
    
}
