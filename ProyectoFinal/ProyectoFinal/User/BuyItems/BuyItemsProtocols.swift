//
//  BuyItemsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

protocol BuyItemsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: BuyItemsPresenterProtocol? { get set }
    
    func sendPrice(price:Int)
}

protocol BuyItemsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createBuyItemsModule(price:Int) -> UIViewController
    func showAddCards(from view:BuyItemsViewProtocol)
    
}

protocol BuyItemsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var precio:Int? {get set}
    var view: BuyItemsViewProtocol? { get set }
    var interactor: BuyItemsInteractorInputProtocol? { get set }
    var wireFrame: BuyItemsWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showAddCards()
    func getAllShopingCar()
}

protocol BuyItemsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol BuyItemsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: BuyItemsInteractorOutputProtocol? { get set }
    var localDatamanager: BuyItemsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: BuyItemsRemoteDataManagerInputProtocol? { get set }
    
    func getAllShopingCar()
}

protocol BuyItemsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol BuyItemsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: BuyItemsRemoteDataManagerOutputProtocol? { get set }
}

protocol BuyItemsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol BuyItemsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var LocalRequestHandler: BuyItemsLocalDataDataManagerOutputProtocol? { get set }
    
    func getAllShopingCar()
    func saveAllBuyItems(compras:[NSManagedObject])
}

protocol BuyItemsLocalDataDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
    
}
