//
//  BuyItemsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol BuyItemsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: BuyItemsPresenterProtocol? { get set }
}

protocol BuyItemsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createBuyItemsModule() -> UIViewController
}

protocol BuyItemsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: BuyItemsViewProtocol? { get set }
    var interactor: BuyItemsInteractorInputProtocol? { get set }
    var wireFrame: BuyItemsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol BuyItemsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol BuyItemsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: BuyItemsInteractorOutputProtocol? { get set }
    var localDatamanager: BuyItemsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: BuyItemsRemoteDataManagerInputProtocol? { get set }
}

protocol BuyItemsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol BuyItemsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: BuyItemsRemoteDataManagerOutputProtocol? { get set }
}

protocol BuyItemsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol BuyItemsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
