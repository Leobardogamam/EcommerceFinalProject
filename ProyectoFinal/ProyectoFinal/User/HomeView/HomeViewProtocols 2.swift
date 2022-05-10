//
//  HomeViewProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol HomeViewViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomeViewPresenterProtocol? { get set }
}

protocol HomeViewWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeViewModule() -> UIViewController
}

protocol HomeViewPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewViewProtocol? { get set }
    var interactor: HomeViewInteractorInputProtocol? { get set }
    var wireFrame: HomeViewWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeViewInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol HomeViewInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeViewInteractorOutputProtocol? { get set }
    var localDatamanager: HomeViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeViewRemoteDataManagerInputProtocol? { get set }
}

protocol HomeViewDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeViewRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeViewRemoteDataManagerOutputProtocol? { get set }
}

protocol HomeViewRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol HomeViewLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
