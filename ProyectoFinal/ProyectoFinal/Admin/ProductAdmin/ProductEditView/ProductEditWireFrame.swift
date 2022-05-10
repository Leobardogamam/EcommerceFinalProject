//
//  ProductEditWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductEditWireFrame: ProductEditWireFrameProtocol {

    class func createProductEditModule(with data : String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProductEditView")
        if let view = viewController as? ProductEditView {
            let presenter: ProductEditPresenterProtocol & ProductEditInteractorOutputProtocol = ProductEditPresenter()
            let interactor: ProductEditInteractorInputProtocol & ProductEditRemoteDataManagerOutputProtocol = ProductEditInteractor()
            let localDataManager: ProductEditLocalDataManagerInputProtocol = ProductEditLocalDataManager()
            let remoteDataManager: ProductEditRemoteDataManagerInputProtocol = ProductEditRemoteDataManager()
            let wireFrame: ProductEditWireFrameProtocol = ProductEditWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.dataReceived = data
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ProductEditView", bundle: Bundle.main)
    }
    
    func presentNewViewProduct(from view: ProductEditViewProtocol) {
        let newDetailView = ProductWireFrame.createProductModule()
        
        if let newView = view as? UIViewController{
                newView.present(newDetailView, animated: true)
           
        }
    }
    
}
