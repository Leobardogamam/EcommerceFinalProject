//
//  ProductEditProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

protocol ProductEditViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ProductEditPresenterProtocol? { get set }
    func presenterGetProductView(receivedProduct: Products)
}

protocol ProductEditWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createProductEditModule(with data : String) -> UIViewController
    
    func presentNewViewProduct(from view : ProductEditViewProtocol)
}

protocol ProductEditPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ProductEditViewProtocol? { get set }
    var interactor: ProductEditInteractorInputProtocol? { get set }
    var wireFrame: ProductEditWireFrameProtocol? { get set }
    var dataReceived : String? { get set }
    
    func viewDidLoad()
    func presenterSaveEditProduct(id : Int, title : String, price : Int)
    func showProductView()
}

protocol ProductEditInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushProductPresenter(receivedProduct: Products)
}

protocol ProductEditInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ProductEditInteractorOutputProtocol? { get set }
    var localDatamanager: ProductEditLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ProductEditRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetProduct(_ url: String)
    func interactorSaveEditProduct(id : Int, title : String, price : Int)
}

protocol ProductEditDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ProductEditRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ProductEditRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetProduct(_ url : String)
    func externalSaveEditProduct(id : Int, title : String, price : Int)
   
}

protocol ProductEditRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func remoteDataManagerCallBackProduct(with producto: Products)
}

protocol ProductEditLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
