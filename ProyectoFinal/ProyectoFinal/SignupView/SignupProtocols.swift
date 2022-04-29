//
//  SignupProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation
import UIKit

protocol SignupViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SignupPresenterProtocol? { get set }
    func alertUserNotAvailable()
    
}

protocol SignupWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createSignupModule() -> UIViewController
}

protocol SignupPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: SignupViewProtocol? { get set }
    var interactor: SignupInteractorInputProtocol? { get set }
    var wireFrame: SignupWireFrameProtocol? { get set }
    var email: String? { get set }
    var password : String? { get set }
    var name : String? { get set }
    
    func viewDidLoad()
   
}

protocol SignupInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCheckUser(userExist : Bool)
    func interactorPushUserAdded(userAdded : UserAdded)
}

protocol SignupInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SignupInteractorOutputProtocol? { get set }
    var localDatamanager: SignupLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SignupRemoteDataManagerInputProtocol? { get set }
    
    func checkUser(email : String)
    func addUser(email : String, password : String, name : String)
}

protocol SignupDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol SignupRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SignupRemoteDataManagerOutputProtocol? { get set }
    func externalCheckUser(email : String)
    func externalAddUser(email : String, password : String, name : String)
}

protocol SignupRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remotePushCheckUser(userExist : Bool)
    func remotepushUserAdded(userAdded : UserAdded)
}

protocol SignupLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
