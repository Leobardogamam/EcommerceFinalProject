//
//  ProductAddProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

protocol ProductAddViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ProductAddPresenterProtocol? { get set }
    func presenterPushCategoriesView(receivedData : [Categories])
    func presenterPushImageAdded(location : String)
    func presenterPushProductAdded(added : Bool)
}

protocol ProductAddWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createProductAddModule() -> UIViewController
    func presentNewViewProduct(from view : ProductAddViewProtocol)
}

protocol ProductAddPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ProductAddViewProtocol? { get set }
    var interactor: ProductAddInteractorInputProtocol? { get set }
    var wireFrame: ProductAddWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func addImage(productImage : UIImage)
    func addProduct(title : String, price : Int, description : String, categoryId : Int, image : String)
    func showProductView()
}

protocol ProductAddInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCategoriesPresenter(receivedData : [Categories])
    func interactorPushImageAdded(receivedData : String)
    func interactorPushProductAdded(added : Bool)
}

protocol ProductAddInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ProductAddInteractorOutputProtocol? { get set }
    var localDatamanager: ProductAddLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ProductAddRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetCategories()
    func interactorUploadImage(productImage : UIImage)
    func interactorAddProduct(title : String, price : Int, description : String, categoryId : Int, image : String)
}

protocol ProductAddDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ProductAddRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ProductAddRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetCategories()
    func externalUploadImage(productImage : UIImage)
    func externalAddProduct(title : String, price : Int, description : String, categoryId : Int, image : String)
}

protocol ProductAddRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func remoteDataManagerCallBackCategories(with categories : [Categories])
    func remoteDataManagerCallBackImageAdded(with location : String)
    func remoteDataManagerCallBackProductAdded(added : Bool)
}

protocol ProductAddLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
