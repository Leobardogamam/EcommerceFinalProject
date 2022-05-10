//
//  CategorieWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieWireFrame: CategorieWireFrameProtocol {
   
    
    class func createCategorieModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CategorieView")
        if let view = viewController as? CategorieView {
            let presenter: CategoriePresenterProtocol & CategorieInteractorOutputProtocol = CategoriePresenter()
            let interactor: CategorieInteractorInputProtocol & CategorieRemoteDataManagerOutputProtocol = CategorieInteractor()
            let localDataManager: CategorieLocalDataManagerInputProtocol = CategorieLocalDataManager()
            let remoteDataManager: CategorieRemoteDataManagerInputProtocol = CategorieRemoteDataManager()
            let wireFrame: CategorieWireFrameProtocol = CategorieWireFrame()
            
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
        return UIStoryboard(name: "CategorieView", bundle: Bundle.main)
    }
    
    func presentNewViewCategorieDetail(from view: CategorieViewProtocol, withData: String) {
        let newDetailView = CategorieDetailWireFrame.createCategorieDetailModule(with: withData)
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewAddCategorie(from view: CategorieViewProtocol) {
        let newDetailView = CategorieAddWireFrame.createCategorieAddModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewProduct(from view: CategorieViewProtocol) {
        let newDetailView = ProductWireFrame.createProductModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewUser(from view: CategorieViewProtocol) {
        let newDetailView = UserWireFrame.createUserModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewProfile(from view: CategorieViewProtocol) {
        let newDetailView = ProfileWireFrame.createProfileModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    

    
}
