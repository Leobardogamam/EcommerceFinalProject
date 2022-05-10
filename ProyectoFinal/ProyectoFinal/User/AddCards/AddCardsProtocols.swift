//
//  AddCardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol AddCardsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: AddCardsPresenterProtocol? { get set }
}

protocol AddCardsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createAddCardsModule() -> UIViewController
}

protocol AddCardsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: AddCardsViewProtocol? { get set }
    var interactor: AddCardsInteractorInputProtocol? { get set }
    var wireFrame: AddCardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol AddCardsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol AddCardsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: AddCardsInteractorOutputProtocol? { get set }
    var localDatamanager: AddCardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: AddCardsRemoteDataManagerInputProtocol? { get set }
}

protocol AddCardsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol AddCardsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: AddCardsRemoteDataManagerOutputProtocol? { get set }
}

protocol AddCardsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol AddCardsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
