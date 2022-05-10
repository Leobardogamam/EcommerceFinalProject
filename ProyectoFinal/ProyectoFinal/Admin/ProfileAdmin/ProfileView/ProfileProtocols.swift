//
//  ProfileProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/8/22.
//  
//

import Foundation
import UIKit

protocol ProfileViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ProfilePresenterProtocol? { get set }
   
}

protocol ProfileWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createProfileModule() -> UIViewController
    
    func presentNewViewProduct(from view : ProfileViewProtocol)
    func presentNewViewCategorie(from view : ProfileViewProtocol)
    func presentNewViewUser(from view : ProfileViewProtocol)
    func presentNewProfileDetailView(from view : ProfileViewProtocol)
}

protocol ProfilePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ProfileViewProtocol? { get set }
    var interactor: ProfileInteractorInputProtocol? { get set }
    var wireFrame: ProfileWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showProductView()
    func showCategorieView()
    func showUserView()
    func showProfileDetailView()
}

protocol ProfileInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol ProfileInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ProfileInteractorOutputProtocol? { get set }
    var localDatamanager: ProfileLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ProfileRemoteDataManagerInputProtocol? { get set }
}

protocol ProfileDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ProfileRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ProfileRemoteDataManagerOutputProtocol? { get set }
}

protocol ProfileRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ProfileLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
