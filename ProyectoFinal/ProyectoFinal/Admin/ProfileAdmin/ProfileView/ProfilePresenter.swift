//
//  ProfilePresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/8/22.
//  
//

import Foundation

class ProfilePresenter  {
    
    // MARK: Properties
    weak var view: ProfileViewProtocol?
    var interactor: ProfileInteractorInputProtocol?
    var wireFrame: ProfileWireFrameProtocol?
    
}

extension ProfilePresenter: ProfilePresenterProtocol {
   
   
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func showProductView() {
        wireFrame?.presentNewViewProduct(from: view!)
    }
    
    func showCategorieView() {
        wireFrame?.presentNewViewCategorie(from: view!)
    }
    
    func showUserView() {
        wireFrame?.presentNewViewUser(from: view!)
    }
    
    func showProfileDetailView() {
        wireFrame?.presentNewProfileDetailView(from: view!)
    }
    
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
