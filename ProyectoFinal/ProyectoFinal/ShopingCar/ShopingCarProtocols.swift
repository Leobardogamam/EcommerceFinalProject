//
//  ShopingCarProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

protocol ShopingCarViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ShopingCarPresenterProtocol? { get set }
    
    func getDatosDescodificados(product:[Product])
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
    func getAllCarCoredataSave()
}

protocol ShopingCarInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func getApiDescodificados(product:[Product], precioTotal: Int)
}

protocol ShopingCarInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ShopingCarInteractorOutputProtocol? { get set }
    var localDatamanager: ShopingCarLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ShopingCarRemoteDataManagerInputProtocol? { get set }
    
    func getAllCarCoredataSave()
}

protocol ShopingCarDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ShopingCarRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ShopingCarRemoteDataManagerOutputProtocol? { get set }
    var localRequestHandler: ShopingCarLocalDataManagerOutputProtocol? { get set }
    
    func getProductsApi(ids:[Int])
}

protocol ShopingCarRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func returnDatosApi(product:Product)
    
}

protocol ShopingCarLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var interactor:ShopingCarLocalDataManagerOutputProtocol? {get set}
    func getAllCarCoredataSave()
}


protocol ShopingCarLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
    
    func getIdProducts(id:Int)
    
}
