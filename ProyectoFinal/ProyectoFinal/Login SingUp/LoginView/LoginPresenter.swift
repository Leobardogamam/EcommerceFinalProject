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
    var userDefault = UserDefaults()
    
    func viewDidLoad() {
        if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                print(loadedPerson.id)
                view?.user = loadedPerson
            }
        }
        
    }
    
    func getLoginAuth(email: String, password: String) {
        interactor?.getUsers(email: email, password: password)
    }
    
    func showSignUpView() {
        wireFrame?.presentNewViewSignUp(from: view!)
    }
    
    
    func showHomeUserView(user:Users) {
        wireFrame?.showHomeUserView(from: view!, user: user)
    }
    
    func showHomeAdminView(user: Users) {
        wireFrame?.showHomeAdminView(from: view!, user: user)
    }
    
    func getUser() {
        interactor?.getUser()
    }
    
    
    
        
}


extension LoginPresenter: LoginInteractorOutputProtocol {
  
    
    // TODO: implement interactor output methods
   
    func isAvailable(isAvailable: Bool) {
        view?.isAvailable(isAvailable: isAvailable)
    }
    
    func returnUser(user: Users) {
        view?.returnUser(user: user)
    }
    
    func interactorPushUserPresenter(users: [Users]) {
        view?.pushUserView(users: users)
    }
    
    
    
}
