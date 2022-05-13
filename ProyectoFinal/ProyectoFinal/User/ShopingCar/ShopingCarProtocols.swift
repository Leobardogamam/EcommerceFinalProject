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

protocol ShopingCarViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ShopingCarPresenterProtocol? { get set }
    var carrito:[Product]? {get set}
    
    func getDatosDescodificados(product:[Product], precioTotal:Int)
    func resetPrice(price:Int)
}

protocol ShopingCarWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createShopingCarModule() -> UIViewController
    static func createShopingCarModule(noUser : Int) -> UIViewController
    
    
    func showUserAccount(from view: ShopingCarViewProtocol)
    func showViewHome(from view: ShopingCarViewProtocol)
    func showBuyItems(from view: ShopingCarViewProtocol, precio:Int)
    func showHomeUserViewWithoutUser(from view : ShopingCarViewProtocol, user : Int)
}

protocol ShopingCarPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var precio:Int? {get set}
    var view: ShopingCarViewProtocol? { get set }
    var interactor: ShopingCarInteractorInputProtocol? { get set }
    var wireFrame: ShopingCarWireFrameProtocol? { get set }
    var noUser : Int? {get set }
    
    func viewDidLoad()
    func getAllCarCoredataSave()
    func eliminate(id:Int,price:Int)
    func showUserAccount()
    func showViewHome()
    func showBuyItems(precio:Int)
    func showHomeUserViewWithoutUser(user : Int)
    func deleteCarWithoutUser()
}

protocol ShopingCarInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func getApiDescodificados(product:[Product], precioTotal: Int)
    func resetPrice(price:Int)
}

protocol ShopingCarInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ShopingCarInteractorOutputProtocol? { get set }
    var localDatamanager: ShopingCarLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ShopingCarRemoteDataManagerInputProtocol? { get set }
    
    func getAllCarCoredataSave()
    func eliminate(id:Int,price:Int)
    func deleteCarWithoutUser()
}

protocol ShopingCarDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ShopingCarRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ShopingCarRemoteDataManagerOutputProtocol? { get set }
    var localRequestHandler: ShopingCarLocalDataManagerOutputProtocol? { get set }
    
    func getProductsApi(ids:[Int])
}

protocol ShopingCarRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func returnDatosApi(product:Product)
    
}

protocol ShopingCarLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler:ShopingCarLocalDataManagerOutputProtocol? {get set}
    func getAllCarCoredataSave()
    func getIdDeleteProduct(id:Int, price:Int)
    func eliminate(data:NSManagedObject, price:Int)
    func localDeleteCartWithoutUser()
}


protocol ShopingCarLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
    func getIdProducts(id:Int)
    func changePrice(price:Int)
}
