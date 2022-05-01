//
//  HomeViewProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol HomeViewViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomeViewPresenterProtocol? { get set }
    func pushData(with data:[Categories])
}

protocol HomeViewWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeViewModule() -> UIViewController
}

protocol HomeViewPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewViewProtocol? { get set }
    var interactor: HomeViewInteractorInputProtocol? { get set }
    var wireFrame: HomeViewWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeViewInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func pushData(with data:[Categories])
}

protocol HomeViewInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeViewInteractorOutputProtocol? { get set }
    var localDatamanager: HomeViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeViewRemoteDataManagerInputProtocol? { get set }
    
    func getCategoriesData()
}

protocol HomeViewDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeViewRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeViewRemoteDataManagerOutputProtocol? { get set }
    
    func callCategoriesData()
}

protocol HomeViewRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func getCategoriesData(with data:[Categories])
}

protocol HomeViewLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
