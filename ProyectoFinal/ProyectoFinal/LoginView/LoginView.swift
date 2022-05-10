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
    var isAvailable:Bool?
    var userDefault = UserDefaults()
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {[self] in
            if user?.id == 3{
                print("Admin")
            }else if user?.id == 0{
                print("Login")
            }else if user == nil{
                print("Logearte")
            }else{
                presenter?.showHomeUserView(user: (user)!)
            }
        }
        
    }
    
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if emailTextField.text!.isEmpty || passTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Agrega los parametros", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)

            alert.addAction(action)
            self.present(alert, animated: true)
        }else{
            presenter?.getLoginAuth(email: emailTextField.text!, password: passTextField.text!)
        }
        
        
    }
    @IBAction func signUpPressed(_ sender: Any) {
        presenter?.showSignUpView()
    }
    @IBAction func forgetPassPressed(_ sender: Any) {
        
    }
}

extension LoginView: LoginViewProtocol {
    func isAvailable(isAvailable: Bool) {
        self.isAvailable = isAvailable
        if isAvailable == false{
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: "Usuario o contraseña incorrecta", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                self.present(alert, animated: true)
            }
            
        }
    }
    
    func returnUser(user: Users) {
        DispatchQueue.main.async {
            if self.isAvailable == true{
                switch user.role{
                case "customer":
                    self.presenter?.showHomeUserView(user: user)
                case "admin":
                    self.presenter?.showHomeAdminView(user: user)
                default:
                    print("Error")
                }
            }
        }
        
    }
    

    
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
                        print("ADMIN")
                    default:
                        print("Error")
                        
                    }
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

