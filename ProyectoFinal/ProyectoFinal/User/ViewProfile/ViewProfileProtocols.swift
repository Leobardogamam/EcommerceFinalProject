//
//  ViewProfileProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol ViewProfileViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ViewProfilePresenterProtocol? { get set }
}

protocol ViewProfileWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createViewProfileModule() -> UIViewController
}

protocol ViewProfilePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ViewProfileViewProtocol? { get set }
    var interactor: ViewProfileInteractorInputProtocol? { get set }
    var wireFrame: ViewProfileWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol ViewProfileInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol ViewProfileInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ViewProfileInteractorOutputProtocol? { get set }
    var localDatamanager: ViewProfileLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ViewProfileRemoteDataManagerInputProtocol? { get set }
}

protocol ViewProfileDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ViewProfileRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ViewProfileRemoteDataManagerOutputProtocol? { get set }
}

protocol ViewProfileRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ViewProfileLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
