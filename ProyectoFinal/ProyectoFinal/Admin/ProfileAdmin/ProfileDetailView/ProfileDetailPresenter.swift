//
//  ProfileDetailPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation

class ProfileDetailPresenter  {
    
    // MARK: Properties
    weak var view: ProfileDetailViewProtocol?
    var interactor: ProfileDetailInteractorInputProtocol?
    var wireFrame: ProfileDetailWireFrameProtocol?
    
}

extension ProfileDetailPresenter: ProfileDetailPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        
    }
    
    func getUsers(){
        
    }
}

extension ProfileDetailPresenter: ProfileDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
