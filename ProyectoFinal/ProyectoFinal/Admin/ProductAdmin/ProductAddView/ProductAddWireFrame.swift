//
//  ProductAddWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductAddWireFrame: ProductAddWireFrameProtocol {

    class func createProductAddModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProductAddView")
        if let view = viewController as? ProductAddView {
            let presenter: ProductAddPresenterProtocol & ProductAddInteractorOutputProtocol = ProductAddPresenter()
            let interactor: ProductAddInteractorInputProtocol & ProductAddRemoteDataManagerOutputProtocol = ProductAddInteractor()
            let localDataManager: ProductAddLocalDataManagerInputProtocol = ProductAddLocalDataManager()
            let remoteDataManager: ProductAddRemoteDataManagerInputProtocol = ProductAddRemoteDataManager()
            let wireFrame: ProductAddWireFrameProtocol = ProductAddWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ProductAddView", bundle: Bundle.main)
    }
    
    func presentNewViewProduct(from view: ProductAddViewProtocol) {
        
        let newDetailView = ProductWireFrame.createProductModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
}
