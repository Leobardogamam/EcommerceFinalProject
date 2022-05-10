//
//  ViewProfileProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol ViewProfileViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ViewProfilePresenterProtocol? { get set }
}

protocol ViewProfileWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createViewProfileModule() -> UIViewController
}

protocol ViewProfilePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ViewProfileViewProtocol? { get set }
    var interactor: ViewProfileInteractorInputProtocol? { get set }
    var wireFrame: ViewProfileWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol ViewProfileInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ViewProfileInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ViewProfileInteractorOutputProtocol? { get set }
    var localDatamanager: ViewProfileLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ViewProfileRemoteDataManagerInputProtocol? { get set }
}

protocol ViewProfileDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ViewProfileRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ViewProfileRemoteDataManagerOutputProtocol? { get set }
}

protocol ViewProfileRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ViewProfileLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
