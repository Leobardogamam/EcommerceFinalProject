//
//  DetailProductViewProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol DetailProductViewViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailProductViewPresenterProtocol? { get set }
    
    func getDataProduct(product:Product)
}

protocol DetailProductViewWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetailProductViewModule(product:Product) -> UIViewController
}

protocol DetailProductViewPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailProductViewViewProtocol? { get set }
    var interactor: DetailProductViewInteractorInputProtocol? { get set }
    var wireFrame: DetailProductViewWireFrameProtocol? { get set }
    var product:Product? {get set}
    
    func viewDidLoad()
    func saveDataInCoreData(idCustomer:Int,idProduct:Int)
}

protocol DetailProductViewInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol DetailProductViewInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetailProductViewInteractorOutputProtocol? { get set }
    var localDatamanager: DetailProductViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailProductViewRemoteDataManagerInputProtocol? { get set }
    
    
    func saveDataInCoreData(idCustomer:Int,idProduct:Int)
}

protocol DetailProductViewDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailProductViewRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailProductViewRemoteDataManagerOutputProtocol? { get set }
}

protocol DetailProductViewRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DetailProductViewLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    
    func saveDataInCoreData(idCustomer:Int,idProduct:Int)
}
