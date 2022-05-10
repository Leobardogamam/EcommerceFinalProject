//
//  SignupPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation
import UIKit

class SignupPresenter: SignupPresenterProtocol  {
    
    // MARK: Properties
    weak var view: SignupViewProtocol?
    var interactor: SignupInteractorInputProtocol?
    var wireFrame: SignupWireFrameProtocol?
    
    var email: String?
    var password: String?
    var name: String?
    var avatarImage: UIImage?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.checkUser(email: email!)
    }
    
}


extension SignupPresenter: SignupInteractorOutputProtocol {
    
   
    // TODO: implement interactor output methods
    func interactorPushCheckUser(userExist: Bool) {
        if userExist{
            interactor?.addImage(avatarImage: avatarImage!)
        }
        else{
            
            DispatchQueue.main.async {
                self.view?.alertUserNotAvailable()
            }
           
        }
    }
    
    func interactorPushImageAdded(imageAdded: String) {
        interactor?.addUser(email: email!, password: password!, name: name!, avatar: imageAdded)
    }
    
    
    func interactorPushUserAdded(userAdded: UserAdded) {
        
    }
    
    
}
