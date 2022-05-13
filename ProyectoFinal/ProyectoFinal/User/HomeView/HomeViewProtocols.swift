//
//  HomeViewProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol HomeViewViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomeViewPresenterProtocol? { get set }
    func pushData(with data:[Categories])
}

protocol HomeViewWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeViewModule() -> UIViewController
    static func createHomeViewModule(user:Users) -> UIViewController
    static func createHomeViewModule(user : Int) -> UIViewController
    func showSpecificCategory(from view:HomeViewViewProtocol,id:Int, name:String)
    func showDetailProduct(from view:HomeViewViewProtocol, product:Product)
    func showShopingCart(from view:HomeViewViewProtocol)
    func showUserAccount(from view:HomeViewViewProtocol)
    func showShopingCartWithoutUser(from view : HomeViewViewProtocol, noUser : Int)
}

protocol HomeViewPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewViewProtocol? { get set }
    var interactor: HomeViewInteractorInputProtocol? { get set }
    var wireFrame: HomeViewWireFrameProtocol? { get set }
    var user: Users? {get set}
    var noUser : Int? {get set}
    
    func viewDidLoad()
//    func getProduct(id:Int)
    func showUserAccount()
    func showShopingCart()
    func showShopingCart(noUser : Int)
    func showSpecifcCategory(id:Int, name: String)
    func showDetailProductView(product: Product)
    func deleteCarWithoutUser()
}

protocol HomeViewInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func pushData(with data:[Categories])
}

protocol HomeViewInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeViewInteractorOutputProtocol? { get set }
    var localDatamanager: HomeViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeViewRemoteDataManagerInputProtocol? { get set }
    
    func getCategoriesData()
    func deleteCarWithoutUser()
}

protocol HomeViewDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeViewRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeViewRemoteDataManagerOutputProtocol? { get set }
    
    func callCategoriesData()
}

protocol HomeViewRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func getCategoriesData(with data:[Categories])
}

protocol HomeViewLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler : HomeViewLocalDataManagerOutputProtocol? {get set}
    
    func localDeleteCartWithoutUser()
}

protocol HomeViewLocalDataManagerOutputProtocol: AnyObject{
    // LOCALDATAMANAGER -> INTERACTOR 
}



