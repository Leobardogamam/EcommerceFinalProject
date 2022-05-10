//
//  SpecificCategoryProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 01/05/22.
//  
//

import Foundation
import UIKit

protocol SpecificCategoryViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: SpecificCategoryPresenterProtocol? { get set }
    func showDataProducts(with product:[Product])
    func sendNameCategory(name:String)
}

protocol SpecificCategoryWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createSpecificCategoryModule(with id:Int, name:String) -> UIViewController
    func showDetailProductView(from view:SpecificCategoryViewProtocol,product:Product)
}

protocol SpecificCategoryPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: SpecificCategoryViewProtocol? { get set }
    var interactor: SpecificCategoryInteractorInputProtocol? { get set }
    var wireFrame: SpecificCategoryWireFrameProtocol? { get set }
    var id:Int? { get set }
    var name:String? {get set}
    
    func viewDidLoad()
    func showDetailProduct(product:Product)
    
    
}

protocol SpecificCategoryInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func showDataProducts(with product:[Product])
}

protocol SpecificCategoryInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: SpecificCategoryInteractorOutputProtocol? { get set }
    var localDatamanager: SpecificCategoryLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SpecificCategoryRemoteDataManagerInputProtocol? { get set }
    
    func getCategory(id:Int)
}

protocol SpecificCategoryDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol SpecificCategoryRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SpecificCategoryRemoteDataManagerOutputProtocol? { get set }
    func getCategory(id:Int)
}

protocol SpecificCategoryRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func showDataProducts(with product:[Product])
}

protocol SpecificCategoryLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
