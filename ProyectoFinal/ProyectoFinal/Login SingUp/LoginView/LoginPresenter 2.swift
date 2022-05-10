//
//  LoginPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//
//

import Foundation

class LoginPresenter: LoginPresenterProtocol  {

    // MARK: Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?

    
    
    
    func viewDidLoad() {
        interactor?.getUsers()
    }
    
    func showSignUpView() {
        wireFrame?.presentNewViewSignUp(from: view!)
    }
    
}


extension LoginPresenter: LoginInteractorOutputProtocol {
    func interactorPushDataPresenter(receivedData: [Users]) {
        view?.compareGetData(userList: receivedData)
    }
    
    // TODO: implement interactor output methods
    
}
