//
//  MyCardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol MyCardsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MyCardsPresenterProtocol? { get set }
}

protocol MyCardsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMyCardsModule() -> UIViewController
}

protocol MyCardsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MyCardsViewProtocol? { get set }
    var interactor: MyCardsInteractorInputProtocol? { get set }
    var wireFrame: MyCardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MyCardsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol MyCardsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MyCardsInteractorOutputProtocol? { get set }
    var localDatamanager: MyCardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MyCardsRemoteDataManagerInputProtocol? { get set }
}

protocol MyCardsDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MyCardsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MyCardsRemoteDataManagerOutputProtocol? { get set }
}

protocol MyCardsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MyCardsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
