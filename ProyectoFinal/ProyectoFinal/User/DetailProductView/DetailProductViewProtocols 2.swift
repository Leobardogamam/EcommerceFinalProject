//
//  DetailProductViewProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol DetailProductViewViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailProductViewPresenterProtocol? { get set }
}

protocol DetailProductViewWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetailProductViewModule() -> UIViewController
}

protocol DetailProductViewPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailProductViewViewProtocol? { get set }
    var interactor: DetailProductViewInteractorInputProtocol? { get set }
    var wireFrame: DetailProductViewWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol DetailProductViewInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol DetailProductViewInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetailProductViewInteractorOutputProtocol? { get set }
    var localDatamanager: DetailProductViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailProductViewRemoteDataManagerInputProtocol? { get set }
}

protocol DetailProductViewDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailProductViewRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailProductViewRemoteDataManagerOutputProtocol? { get set }
}

protocol DetailProductViewRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DetailProductViewLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
