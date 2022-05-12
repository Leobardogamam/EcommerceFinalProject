//
//  ViewPurchasesProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol ViewPurchasesViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ViewPurchasesPresenterProtocol? { get set }
}

protocol ViewPurchasesWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createViewPurchasesModule() -> UIViewController
}

protocol ViewPurchasesPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ViewPurchasesViewProtocol? { get set }
    var interactor: ViewPurchasesInteractorInputProtocol? { get set }
    var wireFrame: ViewPurchasesWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol ViewPurchasesInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol ViewPurchasesInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ViewPurchasesInteractorOutputProtocol? { get set }
    var localDatamanager: ViewPurchasesLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ViewPurchasesRemoteDataManagerInputProtocol? { get set }
    
    func getPurchases()
}

protocol ViewPurchasesDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ViewPurchasesRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ViewPurchasesRemoteDataManagerOutputProtocol? { get set }
}

protocol ViewPurchasesRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ViewPurchasesLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var compras:[CreditCard]? {get set}
    var localRequestHandler:ViewPurchasesLocalDataManagerOutputProtocol?{get set}
    func getPurchases()
}
protocol ViewPurchasesLocalDataManagerOutputProtocol: AnyObject{
    // REMOTEDATAMANAGER -> Interactor
    
    
    func returnData()
    
}

