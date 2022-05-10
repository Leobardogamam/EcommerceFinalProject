//
//  ProductProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

protocol ProductViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ProductPresenterProtocol? { get set }
    func presenterGetProducts(receivedProducts : [Products])
    func loadActivity()
    func stopAndHideActivity()
}

protocol ProductWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createProductModule() -> UIViewController
    static func createProductModule(user : Users) -> UIViewController
    func presentNewViewProductDetail(from view : ProductViewProtocol, withData : String)
    func presentNewViewAddProduct(from view : ProductViewProtocol)
    func presentNewViewCategorie(from view : ProductViewProtocol)
    func presentNewViewUser(from view : ProductViewProtocol)
    func presentNewViewProfile(from view : ProductViewProtocol)
}

protocol ProductPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ProductViewProtocol? { get set }
    var interactor: ProductInteractorInputProtocol? { get set }
    var wireFrame: ProductWireFrameProtocol? { get set }
    var user: Users? {get set}
    
    func viewDidLoad()
    func showDetailProductView(with data : String)
    func showAddProductView()
    func showCategorieView()
    func showUserView()
    func showProfileView()
}

protocol ProductInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushProductsPresenter(receivedProducts : [Products])
}

protocol ProductInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ProductInteractorOutputProtocol? { get set }
    var localDatamanager: ProductLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ProductRemoteDataManagerInputProtocol? { get set }
    
    func getProducts()
}

protocol ProductDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ProductRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ProductRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetProducts()
}

protocol ProductRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func remoteDataManagerCallBackProducts(with products : [Products])
}

protocol ProductLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
