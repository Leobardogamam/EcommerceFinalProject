//
//  LoginProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//
//

import Foundation
import UIKit

protocol LoginViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: LoginPresenterProtocol? { get set }
    var isAvailable:Bool? { get set }
    var user:Users? { get set }
    func isAvailable(isAvailable:Bool)
    func returnUser(user:Users)
    func pushUserView(users : [Users])
}

protocol LoginWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createLoginModule() -> UIViewController
    func presentNewViewSignUp(from view : LoginViewProtocol)
    func showHomeUserView(from view: LoginViewProtocol, user : Users)
    func showHomeAdminView(from view : LoginViewProtocol, user : Users)
}

protocol LoginPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireFrame: LoginWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showSignUpView()
    func showHomeUserView(user: Users)
    func showHomeAdminView(user : Users)
    func getLoginAuth(email:String, password:String)
    func getUser()
}

protocol LoginInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func isAvailable(isAvailable:Bool)
    func returnUser(user:Users)
    func interactorPushUserPresenter(users : [Users])
}

protocol LoginInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: LoginInteractorOutputProtocol? { get set }
    var localDatamanager: LoginLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: LoginRemoteDataManagerInputProtocol? { get set }
    
    func getUsers(email:String, password:String)
    func getUser()
}

protocol LoginDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol LoginRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol? { get set }
    func logingAuth(email: String, password: String)
    func externalGetUser()
}

protocol LoginRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func isAvailable(isAvailable:Bool)
    func returnUser(user:Users)
    func remotePushUserInteractor(users : [Users])
    
}

protocol LoginLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
