//
//  SpecificCategoryWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 01/05/22.
//  
//

import Foundation
import UIKit

class SpecificCategoryWireFrame: SpecificCategoryWireFrameProtocol {
    class func createSpecificCategoryModule(with id: Int, name:String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SpecificCategoryView")
        if let view = viewController as? SpecificCategoryView {
            let presenter: SpecificCategoryPresenterProtocol & SpecificCategoryInteractorOutputProtocol = SpecificCategoryPresenter()
            let interactor: SpecificCategoryInteractorInputProtocol & SpecificCategoryRemoteDataManagerOutputProtocol = SpecificCategoryInteractor()
            let localDataManager: SpecificCategoryLocalDataManagerInputProtocol = SpecificCategoryLocalDataManager()
            let remoteDataManager: SpecificCategoryRemoteDataManagerInputProtocol = SpecificCategoryRemoteDataManager()
            let wireFrame: SpecificCategoryWireFrameProtocol = SpecificCategoryWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.id = id
            presenter.name = name
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "SpecificCategory", bundle: Bundle.main)
    }
    
    func showDetailProductView(from view: SpecificCategoryViewProtocol, product:Product) {
        let newProductView = DetailProductViewWireFrame.createDetailProductViewModule(product: product)
        
        if let newView = view as? UIViewController{
            newView.present(newProductView, animated: true)
        }
    }
}
