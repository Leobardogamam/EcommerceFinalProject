//
//  UserAccountProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol UserAccountViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: UserAccountPresenterProtocol? { get set }
}

protocol UserAccountWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createUserAccountModule() -> UIViewController
}

protocol UserAccountPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: UserAccountViewProtocol? { get set }
    var interactor: UserAccountInteractorInputProtocol? { get set }
    var wireFrame: UserAccountWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol UserAccountInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol UserAccountInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: UserAccountInteractorOutputProtocol? { get set }
    var localDatamanager: UserAccountLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UserAccountRemoteDataManagerInputProtocol? { get set }
}

protocol UserAccountDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol UserAccountRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: UserAccountRemoteDataManagerOutputProtocol? { get set }
}

protocol UserAccountRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol UserAccountLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
