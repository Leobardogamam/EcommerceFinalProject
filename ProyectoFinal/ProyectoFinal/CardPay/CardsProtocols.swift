//
//  CardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol CardsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: CardsPresenterProtocol? { get set }
}

protocol CardsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createCardsModule() -> UIViewController
}

protocol CardsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: CardsViewProtocol? { get set }
    var interactor: CardsInteractorInputProtocol? { get set }
    var wireFrame: CardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol CardsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol CardsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: CardsInteractorOutputProtocol? { get set }
    var localDatamanager: CardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CardsRemoteDataManagerInputProtocol? { get set }
}

protocol CardsDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol CardsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CardsRemoteDataManagerOutputProtocol? { get set }
}

protocol CardsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol CardsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
