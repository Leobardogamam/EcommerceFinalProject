//
//  UserAddProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

protocol UserAddViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: UserAddPresenterProtocol? { get set }
    func presenterPushCheckUser(userExist : Bool)
    func presenterPushImageAdded(imageAdded : String)
    func presenterPushUserAdded(added : Bool)
}

protocol UserAddWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createUserAddModule() -> UIViewController
    
    func presentNewViewUser(from view : UserAddViewProtocol)
}

protocol UserAddPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: UserAddViewProtocol? { get set }
    var interactor: UserAddInteractorInputProtocol? { get set }
    var wireFrame: UserAddWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func checkUser(email : String)
    func addImage(avatarImage : UIImage)
    func addUser(name : String, email : String, password : String, avatar : String)
    func showUserView()
}

protocol UserAddInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCheckUser(userExist : Bool)
    func interactorPushImageAdded(imageAdded : String)
    func interactorPushUserAdded(added : Bool)

}

protocol UserAddInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: UserAddInteractorOutputProtocol? { get set }
    var localDatamanager: UserAddLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UserAddRemoteDataManagerInputProtocol? { get set }
    
    func checkUser(email : String)
    func addImage(avatarImage : UIImage)
    func addUser(name : String, email : String, password : String, avatar : String)
}

protocol UserAddDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol UserAddRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: UserAddRemoteDataManagerOutputProtocol? { get set }
    func externalCheckUser(email : String)
    func externalAddImage(avatarImage : UIImage)
    func externalAddUser(name : String, email : String, password : String, avatar : String)
    
}

protocol UserAddRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remotePushCheckUser(userExist : Bool)
    func remotePushImageAdded(imageAdded : String)
    func remotePushUserAdded(added : Bool)
}

protocol UserAddLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
