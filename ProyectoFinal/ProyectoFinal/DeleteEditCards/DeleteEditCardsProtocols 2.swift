//
//  DeleteEditCardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol DeleteEditCardsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DeleteEditCardsPresenterProtocol? { get set }
}

protocol DeleteEditCardsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDeleteEditCardsModule() -> UIViewController
}

protocol DeleteEditCardsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DeleteEditCardsViewProtocol? { get set }
    var interactor: DeleteEditCardsInteractorInputProtocol? { get set }
    var wireFrame: DeleteEditCardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol DeleteEditCardsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol DeleteEditCardsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DeleteEditCardsInteractorOutputProtocol? { get set }
    var localDatamanager: DeleteEditCardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DeleteEditCardsRemoteDataManagerInputProtocol? { get set }
}

protocol DeleteEditCardsDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DeleteEditCardsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DeleteEditCardsRemoteDataManagerOutputProtocol? { get set }
}

protocol DeleteEditCardsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DeleteEditCardsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
