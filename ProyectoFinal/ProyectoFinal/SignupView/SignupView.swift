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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        if passTextField.text != confirmPass.text{
            let alert = UIAlertController(title: "Error", message: "Las contraseñas no coinciden", preferredStyle: .alert)


            let action = UIAlertAction(title: "Ok", style: .default)

            alert.addAction(action)
            self.present(alert, animated: true)
        }
        else{
            presenter?.email = emailTextField.text
            presenter?.name = nameTextField.text
            presenter?.password = passTextField.text
            presenter?.viewDidLoad()
        }
    }
    
}

extension SignupView: SignupViewProtocol {
   
    // TODO: implement view output methods
    
    func alertUserNotAvailable() {
        let alert = UIAlertController(title: "Error", message: "El usuario ya esta registrado", preferredStyle: .alert)

        let action = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
