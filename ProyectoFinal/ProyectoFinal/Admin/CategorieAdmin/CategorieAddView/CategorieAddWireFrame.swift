//
//  CategorieAddWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieAddWireFrame: CategorieAddWireFrameProtocol {
  
    class func createCategorieAddModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CategorieAddView")
        if let view = viewController as? CategorieAddView {
            let presenter: CategorieAddPresenterProtocol & CategorieAddInteractorOutputProtocol = CategorieAddPresenter()
            let interactor: CategorieAddInteractorInputProtocol & CategorieAddRemoteDataManagerOutputProtocol = CategorieAddInteractor()
            let localDataManager: CategorieAddLocalDataManagerInputProtocol = CategorieAddLocalDataManager()
            let remoteDataManager: CategorieAddRemoteDataManagerInputProtocol = CategorieAddRemoteDataManager()
            let wireFrame: CategorieAddWireFrameProtocol = CategorieAddWireFrame()
            
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
        return UIStoryboard(name: "CategorieAddView", bundle: Bundle.main)
    }
    
    func presentNewViewCategorie(from view: CategorieAddViewProtocol) {
        
        let newDetailView = CategorieWireFrame.createCategorieModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    

}
