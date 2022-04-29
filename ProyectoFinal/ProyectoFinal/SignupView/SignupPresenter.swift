//
//  SignupPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation

class SignupPresenter: SignupPresenterProtocol  {
    
    // MARK: Properties
    weak var view: SignupViewProtocol?
    var interactor: SignupInteractorInputProtocol?
    var wireFrame: SignupWireFrameProtocol?
    
    var email: String?
    var password: String?
    var name: String?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.checkUser(email: email!)
    }
    
}


extension SignupPresenter: SignupInteractorOutputProtocol {
   
    // TODO: implement interactor output methods
    func interactorPushCheckUser(userExist: Bool) {
        if !userExist{
            interactor?.addUser(email: email!, password: password!, name: name!)
        }
        else{
            view?.alertUserNotAvailable()
        }
    }
    
    func interactorPushUserAdded(userAdded: UserAdded) {
        
    }
    
    
}
