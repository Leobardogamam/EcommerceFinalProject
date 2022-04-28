//
//  SignupView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation
import UIKit

class SignupView: UIViewController {

    // MARK: Properties
    var presenter: SignupPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension SignupView: SignupViewProtocol {
    // TODO: implement view output methods
}
