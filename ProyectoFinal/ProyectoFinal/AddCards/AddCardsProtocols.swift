//
//  AddCardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol AddCardsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: AddCardsPresenterProtocol? { get set }
}

protocol AddCardsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createAddCardsModule() -> UIViewController
}

protocol AddCardsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: AddCardsViewProtocol? { get set }
    var interactor: AddCardsInteractorInputProtocol? { get set }
    var wireFrame: AddCardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol AddCardsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol AddCardsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: AddCardsInteractorOutputProtocol? { get set }
    var localDatamanager: AddCardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: AddCardsRemoteDataManagerInputProtocol? { get set }
}

protocol AddCardsDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol AddCardsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: AddCardsRemoteDataManagerOutputProtocol? { get set }
}

protocol AddCardsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol AddCardsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
