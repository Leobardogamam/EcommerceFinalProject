//
//  PerfilWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/2/22.
//  
//

import Foundation
import UIKit

class PerfilWireFrame: PerfilWireFrameProtocol {

    class func createPerfilModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "PerfilView")
        if let view = navController.children.first as? PerfilView {
            let presenter: PerfilPresenterProtocol & PerfilInteractorOutputProtocol = PerfilPresenter()
            let interactor: PerfilInteractorInputProtocol & PerfilRemoteDataManagerOutputProtocol = PerfilInteractor()
            let localDataManager: PerfilLocalDataManagerInputProtocol = PerfilLocalDataManager()
            let remoteDataManager: PerfilRemoteDataManagerInputProtocol = PerfilRemoteDataManager()
            let wireFrame: PerfilWireFrameProtocol = PerfilWireFrame()
            
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
        return UIStoryboard(name: "PerfilView", bundle: Bundle.main)
    }
    
}
