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
    var role:String?
    var user: Users?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
       presenter?.viewDidLoad()
        
    }
    @IBAction func signUpPressed(_ sender: Any) {
        presenter?.showSignUpView()
    }
    @IBAction func forgetPassPressed(_ sender: Any) {
        
    }
}

extension LoginView: LoginViewProtocol {

    
    // TODO: implement view output methods
    
    func compareGetData(userList: [Users]) {
        
        var userExist = false
        
        DispatchQueue.main.async {
            
            for user in userList{
                if user.email == self.emailTextField.text && user.password == self.passTextField.text{
                    self.role = user.role
                    self.user = user
                  userExist = true
                  break
                    
                }else{
                        userExist = false
                     }
                }
            
                if userExist == true{
                    switch self.role{
                    case "customer":
                        self.presenter?.showHomeUserView(user: self.user!)
                    case "admin":
                        print(self.role)
                    default:
                        print("Error")
                        
                    }
//                    let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
                    
                    
                    
//                    let vc = storyboard.instantiateViewController(withIdentifier: "Welcome") as! WelcomeViewController
                
//                    self.present(vc, animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "Usuario o contraseña incorrecta", preferredStyle: .alert)


                    let action = UIAlertAction(title: "Ok", style: .default)

                    alert.addAction(action)
                    self.present(alert, animated: true)
                }
            }

        }
    
    
       
}

