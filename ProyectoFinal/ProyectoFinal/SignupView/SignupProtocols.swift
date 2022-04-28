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
    
    func viewDidLoad()
}

protocol SignupInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol SignupInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SignupInteractorOutputProtocol? { get set }
    var localDatamanager: SignupLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SignupRemoteDataManagerInputProtocol? { get set }
}

protocol SignupDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol SignupRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SignupRemoteDataManagerOutputProtocol? { get set }
}

protocol SignupRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SignupLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
