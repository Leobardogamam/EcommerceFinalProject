//
//  UserAccountProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol UserAccountViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: UserAccountPresenterProtocol? { get set }
}

protocol UserAccountWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createUserAccountModule() -> UIViewController
}

protocol UserAccountPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: UserAccountViewProtocol? { get set }
    var interactor: UserAccountInteractorInputProtocol? { get set }
    var wireFrame: UserAccountWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol UserAccountInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol UserAccountInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: UserAccountInteractorOutputProtocol? { get set }
    var localDatamanager: UserAccountLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UserAccountRemoteDataManagerInputProtocol? { get set }
}

protocol UserAccountDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol UserAccountRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: UserAccountRemoteDataManagerOutputProtocol? { get set }
}

protocol UserAccountRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol UserAccountLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
