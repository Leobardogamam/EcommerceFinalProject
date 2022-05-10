//
//  ProductWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductWireFrame: ProductWireFrameProtocol {
   
    class func createProductModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProductView")
        if let view = viewController as? ProductView {
            let presenter: ProductPresenterProtocol & ProductInteractorOutputProtocol = ProductPresenter()
            let interactor: ProductInteractorInputProtocol & ProductRemoteDataManagerOutputProtocol = ProductInteractor()
            let localDataManager: ProductLocalDataManagerInputProtocol = ProductLocalDataManager()
            let remoteDataManager: ProductRemoteDataManagerInputProtocol = ProductRemoteDataManager()
            let wireFrame: ProductWireFrameProtocol = ProductWireFrame()
            
            
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
    
   
    class func createProductModule(user : Users) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProductView")
        if let view = viewController as? ProductView {
            let presenter: ProductPresenterProtocol & ProductInteractorOutputProtocol = ProductPresenter()
            let interactor: ProductInteractorInputProtocol & ProductRemoteDataManagerOutputProtocol = ProductInteractor()
            let localDataManager: ProductLocalDataManagerInputProtocol = ProductLocalDataManager()
            let remoteDataManager: ProductRemoteDataManagerInputProtocol = ProductRemoteDataManager()
            let wireFrame: ProductWireFrameProtocol = ProductWireFrame()
            
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.user = user
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
  
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ProductView", bundle: Bundle.main)
    }
    
    func presentNewViewProductDetail(from view: ProductViewProtocol, withData: String) {
        let newDetailView = ProductDetailWireFrame.createProductDetailModule(with: withData)
        
        if let newView = view as? UIViewController{
            
                newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewAddProduct(from view: ProductViewProtocol) {
        let newDetailView = ProductAddWireFrame.createProductAddModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewCategorie(from view: ProductViewProtocol) {
        let newDetailView = CategorieWireFrame.createCategorieModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewUser(from view: ProductViewProtocol) {
        let newDetailView = UserWireFrame.createUserModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewProfile(from view: ProductViewProtocol) {
        let newDetailView = ProfileWireFrame.createProfileModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    

    
}
