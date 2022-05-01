//
//  ShopingCarProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol ShopingCarViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ShopingCarPresenterProtocol? { get set }
}

protocol ShopingCarWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createShopingCarModule() -> UIViewController
}

protocol ShopingCarPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ShopingCarViewProtocol? { get set }
    var interactor: ShopingCarInteractorInputProtocol? { get set }
    var wireFrame: ShopingCarWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol ShopingCarInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ShopingCarInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ShopingCarInteractorOutputProtocol? { get set }
    var localDatamanager: ShopingCarLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ShopingCarRemoteDataManagerInputProtocol? { get set }
}

protocol ShopingCarDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ShopingCarRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ShopingCarRemoteDataManagerOutputProtocol? { get set }
}

protocol ShopingCarRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ShopingCarLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
