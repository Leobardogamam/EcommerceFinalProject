//
//  ViewPurchasesProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol ViewPurchasesViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ViewPurchasesPresenterProtocol? { get set }
}

protocol ViewPurchasesWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createViewPurchasesModule() -> UIViewController
}

protocol ViewPurchasesPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ViewPurchasesViewProtocol? { get set }
    var interactor: ViewPurchasesInteractorInputProtocol? { get set }
    var wireFrame: ViewPurchasesWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol ViewPurchasesInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ViewPurchasesInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ViewPurchasesInteractorOutputProtocol? { get set }
    var localDatamanager: ViewPurchasesLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ViewPurchasesRemoteDataManagerInputProtocol? { get set }
}

protocol ViewPurchasesDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ViewPurchasesRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ViewPurchasesRemoteDataManagerOutputProtocol? { get set }
}

protocol ViewPurchasesRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ViewPurchasesLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
