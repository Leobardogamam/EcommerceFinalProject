//
//  CategorieProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

protocol CategorieViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: CategoriePresenterProtocol? { get set }
    
    func presenterGetCategoriesView(receivedData: [Categories])
    func loadActivity()
    func stopAndHideActivity()
}

protocol CategorieWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createCategorieModule() -> UIViewController
    func presentNewViewCategorieDetail(from view : CategorieViewProtocol, withData : String)
    func presentNewViewAddCategorie(from view : CategorieViewProtocol)
    func presentNewViewProduct(from view : CategorieViewProtocol)
    func presentNewViewUser(from view : CategorieViewProtocol)
    func presentNewViewProfile(from view : CategorieViewProtocol)
}

protocol CategoriePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CategorieViewProtocol? { get set }
    var interactor: CategorieInteractorInputProtocol? { get set }
    var wireFrame: CategorieWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showDetailCategorieView(with data : String)
    func showAddCategorie()
    func showProductView()
    func showUserView()
    func showProfileUser()
}

protocol CategorieInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCategoriesPresenter(receivedData: [Categories])
}

protocol CategorieInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CategorieInteractorOutputProtocol? { get set }
    var localDatamanager: CategorieLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CategorieRemoteDataManagerInputProtocol? { get set }
    
    func getCategories()
}

protocol CategorieDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CategorieRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CategorieRemoteDataManagerOutputProtocol? { get set }
    func externalGetCategories()
}

protocol CategorieRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackCategories(with categories: [Categories])
}

protocol CategorieLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
