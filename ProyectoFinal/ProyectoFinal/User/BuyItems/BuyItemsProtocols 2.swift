//
//  BuyItemsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol BuyItemsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: BuyItemsPresenterProtocol? { get set }
}

protocol BuyItemsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createBuyItemsModule() -> UIViewController
}

protocol BuyItemsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: BuyItemsViewProtocol? { get set }
    var interactor: BuyItemsInteractorInputProtocol? { get set }
    var wireFrame: BuyItemsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol BuyItemsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol BuyItemsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: BuyItemsInteractorOutputProtocol? { get set }
    var localDatamanager: BuyItemsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: BuyItemsRemoteDataManagerInputProtocol? { get set }
}

protocol BuyItemsDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol BuyItemsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: BuyItemsRemoteDataManagerOutputProtocol? { get set }
}

protocol BuyItemsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol BuyItemsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
