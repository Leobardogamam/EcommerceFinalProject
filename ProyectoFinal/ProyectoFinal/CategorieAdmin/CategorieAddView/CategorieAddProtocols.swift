//
//  CategorieAddProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

protocol CategorieAddViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: CategorieAddPresenterProtocol? { get set }
    func presenterPushImageAdded(location : String)
    func presenterPushCategorieAdded(added : Bool)
}

protocol CategorieAddWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createCategorieAddModule() -> UIViewController
    func presentNewViewCategorie(from view : CategorieAddViewProtocol)
}

protocol CategorieAddPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CategorieAddViewProtocol? { get set }
    var interactor: CategorieAddInteractorInputProtocol? { get set }
    var wireFrame: CategorieAddWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func addImage(productImage : UIImage)
    func addCategorie(name : String, image : String)
    func showCategorieView()
}

protocol CategorieAddInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    
    func interactorPushImageAdded(receivedData : String)
    func interactorPushCategorieAdded(added : Bool)
}

protocol CategorieAddInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CategorieAddInteractorOutputProtocol? { get set }
    var localDatamanager: CategorieAddLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CategorieAddRemoteDataManagerInputProtocol? { get set }
    
    func interactorUploadImage(productImage : UIImage)
    func interactorAddCategorie(name : String, image : String)
}

protocol CategorieAddDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CategorieAddRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CategorieAddRemoteDataManagerOutputProtocol? { get set }
    
    func externalUploadImage(productImage : UIImage)
    func externalAddCategorie(name : String, image : String)
}

protocol CategorieAddRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func remoteDataManagerCallBackImageAdded(with location : String)
    func remoteDataManagerCallBackProductAdded(added : Bool)
}

protocol CategorieAddLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
