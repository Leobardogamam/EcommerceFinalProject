//
//  UserPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/7/22.
//  
//

import Foundation

class UserPresenter  {
    
    // MARK: Properties
    weak var view: UserViewProtocol?
    var interactor: UserInteractorInputProtocol?
    var wireFrame: UserWireFrameProtocol?
    
}

extension UserPresenter: UserPresenterProtocol {
  
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.loadActivity()
        interactor?.getUsers()
    }
    
    func showProductView() {
        wireFrame?.presentNewViewProduct(from: view!)
    }
    
    func showCategorieView() {
        wireFrame?.presentNewViewCategorie(from: view!)
    }
    
    func showProfileView() {
        wireFrame?.presentNewViewProfile(from: view!)
    }
    
    func showDetailProfileView() {
        wireFrame?.presentNewDetailProfile(from: view!)
    }
    
    func showAddUserView() {
        wireFrame?.presentNewViewUserAdd(from: view!)
    }
    
    
 
}

extension UserPresenter: UserInteractorOutputProtocol {
   
    
    // TODO: implement interactor output methods
    
    func interactorPushUsersPresenter(receivedUsers: [Users]) {
        view?.stopAndHideActivity()
        view?.presenterGetUsers(receivedUsers: receivedUsers)
    }
}
