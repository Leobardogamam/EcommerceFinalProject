//
//  MyCardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol MyCardsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MyCardsPresenterProtocol? { get set }
}

protocol MyCardsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createMyCardsModule() -> UIViewController
}

protocol MyCardsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: MyCardsViewProtocol? { get set }
    var interactor: MyCardsInteractorInputProtocol? { get set }
    var wireFrame: MyCardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MyCardsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol MyCardsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: MyCardsInteractorOutputProtocol? { get set }
    var localDatamanager: MyCardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MyCardsRemoteDataManagerInputProtocol? { get set }
}

protocol MyCardsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol MyCardsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MyCardsRemoteDataManagerOutputProtocol? { get set }
}

protocol MyCardsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MyCardsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
