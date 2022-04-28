//
//  SignupPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation

class SignupPresenter  {
    
    // MARK: Properties
    weak var view: SignupViewProtocol?
    var interactor: SignupInteractorInputProtocol?
    var wireFrame: SignupWireFrameProtocol?
    
}

extension SignupPresenter: SignupPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension SignupPresenter: SignupInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
