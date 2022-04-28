//
//  LoginView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation
import UIKit

class LoginView: UIViewController {

    // MARK: Properties
    var presenter: LoginPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        presenter?.showSignUpView()
    }
}

extension LoginView: LoginViewProtocol {
    // TODO: implement view output methods
}
