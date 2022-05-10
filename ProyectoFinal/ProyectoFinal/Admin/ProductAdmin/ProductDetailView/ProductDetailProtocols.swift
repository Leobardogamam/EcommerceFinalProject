//
//  ProductDetailProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

protocol ProductDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ProductDetailPresenterProtocol? { get set }
    func presenterGetProductView(receivedProduct: Products)
}

protocol ProductDetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createProductDetailModule(with data : String) -> UIViewController
    func presentNewEditView(from view : ProductDetailViewProtocol, withData : String)
    func presentNewViewProduct(from view : ProductDetailViewProtocol)
}

protocol ProductDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ProductDetailViewProtocol? { get set }
    var interactor: ProductDetailInteractorInputProtocol? { get set }
    var wireFrame: ProductDetailWireFrameProtocol? { get set }
    var dataReceived : String? { get set }
    
    func viewDidLoad()
    func showEditProductView(with data : String)
    func deleteProduct(with id : Int)
    func showProductView()
}

protocol ProductDetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushProductPresenter(receivedProduct: Products)
}

protocol ProductDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ProductDetailInteractorOutputProtocol? { get set }
    var localDatamanager: ProductDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ProductDetailRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetProduct(_ url: String)
    func interactorDeleteProduct(id : Int)
}

protocol ProductDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ProductDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ProductDetailRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetProduct(_ url : String)
    func externalDeleteProduct(id : Int)
}

protocol ProductDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func remoteDataManagerCallBackProduct(with producto: Products)
}

protocol ProductDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
