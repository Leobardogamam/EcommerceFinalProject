//
//  UserProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/7/22.
//  
//

import Foundation
import UIKit

protocol UserViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: UserPresenterProtocol? { get set }
    func presenterGetUsers(receivedUsers : [Users])
    func loadActivity()
    func stopAndHideActivity()
}

protocol UserWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createUserModule() -> UIViewController
    func presentNewViewProduct(from view : UserViewProtocol)
    func presentNewViewCategorie(from view : UserViewProtocol)
    func presentNewViewProfile(from view : UserViewProtocol)
    func presentNewDetailProfile(from view : UserViewProtocol)
    func presentNewViewUserAdd(from view : UserViewProtocol)
}

protocol UserPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: UserViewProtocol? { get set }
    var interactor: UserInteractorInputProtocol? { get set }
    var wireFrame: UserWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showProductView()
    func showCategorieView()
    func showProfileView()
    func showDetailProfileView()
    func showAddUserView()
}

protocol UserInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushUsersPresenter(receivedUsers : [Users])
}

protocol UserInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: UserInteractorOutputProtocol? { get set }
    var localDatamanager: UserLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UserRemoteDataManagerInputProtocol? { get set }
    
    func getUsers()
}

protocol UserDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol UserRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: UserRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetUsers()
}

protocol UserRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func remoteDataManagerCallBackUsers(with users : [Users])
}

protocol UserLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
