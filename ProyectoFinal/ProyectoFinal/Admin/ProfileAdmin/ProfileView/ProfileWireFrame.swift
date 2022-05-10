//
//  ProfileWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/8/22.
//  
//

import Foundation
import UIKit

class ProfileWireFrame: ProfileWireFrameProtocol {
   
    class func createProfileModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileView")
        if let view = viewController as? ProfileView {
            let presenter: ProfilePresenterProtocol & ProfileInteractorOutputProtocol = ProfilePresenter()
            let interactor: ProfileInteractorInputProtocol & ProfileRemoteDataManagerOutputProtocol = ProfileInteractor()
            let localDataManager: ProfileLocalDataManagerInputProtocol = ProfileLocalDataManager()
            let remoteDataManager: ProfileRemoteDataManagerInputProtocol = ProfileRemoteDataManager()
            let wireFrame: ProfileWireFrameProtocol = ProfileWireFrame()
            
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
        return UIStoryboard(name: "ProfileView", bundle: Bundle.main)
    }
    
    func presentNewViewProduct(from view: ProfileViewProtocol) {
        let newDetailView = ProductWireFrame.createProductModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewCategorie(from view: ProfileViewProtocol) {
        let newDetailView = CategorieWireFrame.createCategorieModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewViewUser(from view: ProfileViewProtocol) {
        let newDetailView = UserWireFrame.createUserModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    func presentNewProfileDetailView(from view: ProfileViewProtocol) {
        let newDetailView = ProfileDetailWireFrame.createProfileDetailModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
  
    

    
}
