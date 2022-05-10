//
//  CategorieDetailWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieDetailWireFrame: CategorieDetailWireFrameProtocol {

    class func createCategorieDetailModule(with data : String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CategorieDetailView")
        if let view = viewController as? CategorieDetailView {
            let presenter: CategorieDetailPresenterProtocol & CategorieDetailInteractorOutputProtocol = CategorieDetailPresenter()
            let interactor: CategorieDetailInteractorInputProtocol & CategorieDetailRemoteDataManagerOutputProtocol = CategorieDetailInteractor()
            let localDataManager: CategorieDetailLocalDataManagerInputProtocol = CategorieDetailLocalDataManager()
            let remoteDataManager: CategorieDetailRemoteDataManagerInputProtocol = CategorieDetailRemoteDataManager()
            let wireFrame: CategorieDetailWireFrameProtocol = CategorieDetailWireFrame()
            
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
        return UIStoryboard(name: "CategorieDetailView", bundle: Bundle.main)
    }
    
    func presentNewViewCategorieEdit(from view: CategorieDetailViewProtocol, withData: String) {
        let newDetailView = CategorieEditWireFrame.createCategorieEditModule(with: withData)
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
}
