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
    var users : [Users]?
    var flagUser = false
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.getUser()
        
    }
    override func viewWillAppear(_ animated: Bool) {

    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Recuperar contraseña", message: "Por favor introduzca su correo", preferredStyle: .alert)
        
        alert.addTextField()

        
        guard let textFieldMail = alert.textFields?[0] else {return}

            
      
        textFieldMail.placeholder = "Email"
        

        let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            self.showAlertWithPassword(mail: textFieldMail.text!)
        }
        
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
        
       
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    func showAlertWithPassword(mail : String){
        for user in self.users!{
            if user.email == mail{
                let alert = UIAlertController(title: "Recuperar contraseña", message: "Su contraseña es: \(user.password)", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default)
                
       
                flagUser = true
                alert.addAction(action)
                self.present(alert, animated: true)
                break
                
            }
            else{
                flagUser = false
                
            }
        }
        
        if flagUser == false{
            let alert = UIAlertController(title: "Error", message: "Este usuario no esta registrado", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default)
            
   
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    
    func checkUser(){
        DispatchQueue.main.async {[self] in
            if user?.id == 3{
                print("Admin")
            }else if user?.id == 0{
                print("Login")
            }else if user == nil{
                print("Logearte")
            }else{
                guard let listUsers = users else {return}
                for user in listUsers{
                    if self.user!.id == user.id{
                        presenter?.showHomeUserView(user: (user))
                    }
                    else{
                        let alert = UIAlertController(title: "Aviso", message: "Se cerro tu sesion debido a que tu id ya no existe", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .default)
                        alert.addAction(action)
                        self.present(alert, animated: true)
                    }
                }
               
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
    
    @IBAction func guestPressed(_ sender: Any) {
        presenter?.showHomeUserViewWithoutUser(user: 0)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        presenter?.showSignUpView()
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
    
    func pushUserView(users: [Users]) {
        self.users = users
        checkUser()
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

