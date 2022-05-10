//
//  CategorieEditProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

protocol CategorieEditViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: CategorieEditPresenterProtocol? { get set }
    func presenterGetCategorie(receivedCategorie: Categories)
    func presenterShowAlert(edited : Bool)
}

protocol CategorieEditWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createCategorieEditModule(with data : String) -> UIViewController
    func presentNewViewCategorie(from view : CategorieEditViewProtocol)
}

protocol CategorieEditPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CategorieEditViewProtocol? { get set }
    var interactor: CategorieEditInteractorInputProtocol? { get set }
    var wireFrame: CategorieEditWireFrameProtocol? { get set }
    var dataReceived : String? { get set }
    
    func viewDidLoad()
    func presenterSaveEditCategorie(id : Int, name : String)
    func showCategorieView()
}

protocol CategorieEditInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCategoriePresenter(receivedData: Categories)
    func interactorPushEditedCategorie(edited : Bool)
}

protocol CategorieEditInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CategorieEditInteractorOutputProtocol? { get set }
    var localDatamanager: CategorieEditLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CategorieEditRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetCategorie(_ url: String)
    func interactorSaveEditCategorie(id : Int, name : String)
}

protocol CategorieEditDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CategorieEditRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CategorieEditRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetCategorie(_ url : String)
    func externalSaveEditCategorie(id : Int, name : String)
}

protocol CategorieEditRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func remoteDataManagerCallBackCategorie(with categories: Categories)
    func remoteDataManagerCallBackEditedCategorie(with edited : Bool)
}

protocol CategorieEditLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
