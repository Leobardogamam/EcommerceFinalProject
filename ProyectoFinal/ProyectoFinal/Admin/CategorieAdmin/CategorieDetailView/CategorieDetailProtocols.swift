//
//  CategorieDetailProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

protocol CategorieDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: CategorieDetailPresenterProtocol? { get set }
    func presenterGetCategories(receivedCategorie: Categories)
}

protocol CategorieDetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createCategorieDetailModule(with data : String) -> UIViewController
    func presentNewViewCategorieEdit(from view : CategorieDetailViewProtocol, withData : String)
}

protocol CategorieDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CategorieDetailViewProtocol? { get set }
    var interactor: CategorieDetailInteractorInputProtocol? { get set }
    var wireFrame: CategorieDetailWireFrameProtocol? { get set }
    var dataReceived : String? { get set }
    
    func viewDidLoad()
    func showEditCategorieView(with data : String)
}

protocol CategorieDetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCategorie(receivedCategorie: Categories)
   
}

protocol CategorieDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CategorieDetailInteractorOutputProtocol? { get set }
    var localDatamanager: CategorieDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CategorieDetailRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetCategorie(_ url: String)
}

protocol CategorieDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CategorieDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CategorieDetailRemoteDataManagerOutputProtocol? { get set }
    func externalGetCategories(_ url : String)
}

protocol CategorieDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackCategorie(with categorie: Categories)
}

protocol CategorieDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
