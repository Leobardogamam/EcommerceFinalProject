//
//  CardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol CardsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: CardsPresenterProtocol? { get set }
}

protocol CardsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createCardsModule() -> UIViewController
}

protocol CardsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CardsViewProtocol? { get set }
    var interactor: CardsInteractorInputProtocol? { get set }
    var wireFrame: CardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol CardsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol CardsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CardsInteractorOutputProtocol? { get set }
    var localDatamanager: CardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CardsRemoteDataManagerInputProtocol? { get set }
}

protocol CardsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CardsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CardsRemoteDataManagerOutputProtocol? { get set }
}

protocol CardsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol CardsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
