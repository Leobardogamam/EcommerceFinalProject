//
//  HomeViewWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class HomeViewWireFrame: HomeViewWireFrameProtocol {

    class func createHomeViewModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewView")
        if let view = navController.children.first as? HomeViewView {
            let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputProtocol = HomeViewPresenter()
            let interactor: HomeViewInteractorInputProtocol & HomeViewRemoteDataManagerOutputProtocol = HomeViewInteractor()
            let localDataManager: HomeViewLocalDataManagerInputProtocol = HomeViewLocalDataManager()
            let remoteDataManager: HomeViewRemoteDataManagerInputProtocol = HomeViewRemoteDataManager()
            let wireFrame: HomeViewWireFrameProtocol = HomeViewWireFrame()
            
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
        return UIStoryboard(name: "HomeViewView", bundle: Bundle.main)
    }
    
}
