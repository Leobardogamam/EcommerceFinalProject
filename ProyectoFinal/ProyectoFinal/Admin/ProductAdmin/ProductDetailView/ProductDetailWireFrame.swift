//
//  ProductDetailWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductDetailWireFrame: ProductDetailWireFrameProtocol {


    class func createProductDetailModule(with data : String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProductDetailView")
        if let view = viewController as? ProductDetailView {
            let presenter: ProductDetailPresenterProtocol & ProductDetailInteractorOutputProtocol = ProductDetailPresenter()
            let interactor: ProductDetailInteractorInputProtocol & ProductDetailRemoteDataManagerOutputProtocol = ProductDetailInteractor()
            let localDataManager: ProductDetailLocalDataManagerInputProtocol = ProductDetailLocalDataManager()
            let remoteDataManager: ProductDetailRemoteDataManagerInputProtocol = ProductDetailRemoteDataManager()
            let wireFrame: ProductDetailWireFrameProtocol = ProductDetailWireFrame()
            
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
        return UIStoryboard(name: "ProductDetailView", bundle: Bundle.main)
    }
    
    func presentNewEditView(from view: ProductDetailViewProtocol, withData: String) {
        
        let newDetailView = ProductEditWireFrame.createProductEditModule(with: withData)
        
        
        
        if let newView = view as? UIViewController{
            
            
            newView.present(newDetailView, animated: true)
           
        }

    }
    
    func presentNewViewProduct(from view: ProductDetailViewProtocol) {
        let newDetailView = ProductWireFrame.createProductModule()
        
        if let newView = view as? UIViewController{
            
      
                newView.present(newDetailView, animated: true)
            
            
        }
    }
    
}
