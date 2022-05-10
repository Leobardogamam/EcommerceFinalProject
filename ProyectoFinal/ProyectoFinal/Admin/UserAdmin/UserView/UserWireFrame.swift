//
//  UserWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/7/22.
//  
//

import Foundation
import UIKit

class UserWireFrame: UserWireFrameProtocol {
    
    class func createUserModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "UserView")
        if let view = viewController as? UserView {
            let presenter: UserPresenterProtocol & UserInteractorOutputProtocol = UserPresenter()
            let interactor: UserInteractorInputProtocol & UserRemoteDataManagerOutputProtocol = UserInteractor()
            let localDataManager: UserLocalDataManagerInputProtocol = UserLocalDataManager()
            let remoteDataManager: UserRemoteDataManagerInputProtocol = UserRemoteDataManager()
            let wireFrame: UserWireFrameProtocol = UserWireFrame()
            
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
        return UIStoryboard(name: "UserView", bundle: Bundle.main)
    }
    
    func presentNewViewProduct(from view: UserViewProtocol) {
        let newDetailView = ProductWireFrame.createProductModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewCategorie(from view: UserViewProtocol) {
        
        let newDetailView = CategorieWireFrame.createCategorieModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }

    func presentNewViewProfile(from view: UserViewProtocol) {
        let newDetailView = ProfileWireFrame.createProfileModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewDetailProfile(from view: UserViewProtocol) {
        let newDetailView = ProfileDetailWireFrame.createProfileDetailModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewUserAdd(from view: UserViewProtocol) {
        let newDetailView = UserAddWireFrame.createUserAddModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    

    
  
    
}
