//
//  CategorieEditWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieEditWireFrame: CategorieEditWireFrameProtocol {
    
    class func createCategorieEditModule(with data : String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CategorieEditView")
        if let view = viewController as? CategorieEditView {
            let presenter: CategorieEditPresenterProtocol & CategorieEditInteractorOutputProtocol = CategorieEditPresenter()
            let interactor: CategorieEditInteractorInputProtocol & CategorieEditRemoteDataManagerOutputProtocol = CategorieEditInteractor()
            let localDataManager: CategorieEditLocalDataManagerInputProtocol = CategorieEditLocalDataManager()
            let remoteDataManager: CategorieEditRemoteDataManagerInputProtocol = CategorieEditRemoteDataManager()
            let wireFrame: CategorieEditWireFrameProtocol = CategorieEditWireFrame()
            
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
        return UIStoryboard(name: "CategorieEditView", bundle: Bundle.main)
    }
    
    func presentNewViewCategorie(from view: CategorieEditViewProtocol) {
        let newDetailView = CategorieWireFrame.createCategorieModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
}
