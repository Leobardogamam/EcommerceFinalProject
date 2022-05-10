//
//  ViewProfileWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ViewProfileWireFrame: ViewProfileWireFrameProtocol {

    class func createViewProfileModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ViewProfileView")
        if let view = navController.children.first as? ViewProfileView {
            let presenter: ViewProfilePresenterProtocol & ViewProfileInteractorOutputProtocol = ViewProfilePresenter()
            let interactor: ViewProfileInteractorInputProtocol & ViewProfileRemoteDataManagerOutputProtocol = ViewProfileInteractor()
            let localDataManager: ViewProfileLocalDataManagerInputProtocol = ViewProfileLocalDataManager()
            let remoteDataManager: ViewProfileRemoteDataManagerInputProtocol = ViewProfileRemoteDataManager()
            let wireFrame: ViewProfileWireFrameProtocol = ViewProfileWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ViewProfileView", bundle: Bundle.main)
    }
    
}
