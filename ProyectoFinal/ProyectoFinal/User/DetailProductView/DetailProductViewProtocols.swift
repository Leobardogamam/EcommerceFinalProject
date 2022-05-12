//
//  DetailProductViewProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol DetailProductViewViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailProductViewPresenterProtocol? { get set }
    
    func getDataProduct(product:Product)
}

protocol DetailProductViewWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createDetailProductViewModule(product:Product) -> UIViewController
}

protocol DetailProductViewPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailProductViewViewProtocol? { get set }
    var interactor: DetailProductViewInteractorInputProtocol? { get set }
    var wireFrame: DetailProductViewWireFrameProtocol? { get set }
    var product:Product? {get set}
    
    func viewDidLoad()
    func saveDataInCoreData(idCustomer:Int,idProduct:Int)
}

protocol DetailProductViewInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol DetailProductViewInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetailProductViewInteractorOutputProtocol? { get set }
    var localDatamanager: DetailProductViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailProductViewRemoteDataManagerInputProtocol? { get set }
    
    
    func saveDataInCoreData(idCustomer:Int,idProduct:Int)
}

protocol DetailProductViewDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailProductViewRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailProductViewRemoteDataManagerOutputProtocol? { get set }
}

protocol DetailProductViewRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DetailProductViewLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    func saveDataInCoreData(idCustomer:Int,idProduct:Int)
}
