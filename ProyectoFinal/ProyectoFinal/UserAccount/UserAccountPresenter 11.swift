//
//  UserAccountPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class UserAccountPresenter  {
    
    // MARK: Properties
    weak var view: UserAccountViewProtocol?
    var interactor: UserAccountInteractorInputProtocol?
    var wireFrame: UserAccountWireFrameProtocol?
    
}

extension UserAccountPresenter: UserAccountPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension UserAccountPresenter: UserAccountInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
