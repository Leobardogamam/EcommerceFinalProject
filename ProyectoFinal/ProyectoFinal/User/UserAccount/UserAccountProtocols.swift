//
//  UserAccountProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol UserAccountViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: UserAccountPresenterProtocol? { get set }
}

protocol UserAccountWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createUserAccountModule() -> UIViewController
    
    func showViewProfile(from view:UserAccountViewProtocol)
    func showMyCards(from view:UserAccountViewProtocol)
    func showViewPurchases(from view:UserAccountViewProtocol)
    func showLoginView(from view:UserAccountViewProtocol)
    func showHomeView(from view:UserAccountViewProtocol)
    func showShopingCart(from view:UserAccountViewProtocol)
}

protocol UserAccountPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: UserAccountViewProtocol? { get set }
    var interactor: UserAccountInteractorInputProtocol? { get set }
    var wireFrame: UserAccountWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showViewProfile()
    func showMyCards()
    func showViewPurchases()
    func showLoginView()
    func showHomeView()
    func showShopingCart()

}

protocol UserAccountInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol UserAccountInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: UserAccountInteractorOutputProtocol? { get set }
    var localDatamanager: UserAccountLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UserAccountRemoteDataManagerInputProtocol? { get set }
}

protocol UserAccountDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol UserAccountRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: UserAccountRemoteDataManagerOutputProtocol? { get set }
}

protocol UserAccountRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol UserAccountLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
