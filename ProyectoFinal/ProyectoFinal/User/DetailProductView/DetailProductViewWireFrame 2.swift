//
//  DetailProductViewWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class DetailProductViewWireFrame: DetailProductViewWireFrameProtocol {

    class func createDetailProductViewModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "DetailProductViewView")
        if let view = navController.children.first as? DetailProductViewView {
            let presenter: DetailProductViewPresenterProtocol & DetailProductViewInteractorOutputProtocol = DetailProductViewPresenter()
            let interactor: DetailProductViewInteractorInputProtocol & DetailProductViewRemoteDataManagerOutputProtocol = DetailProductViewInteractor()
            let localDataManager: DetailProductViewLocalDataManagerInputProtocol = DetailProductViewLocalDataManager()
            let remoteDataManager: DetailProductViewRemoteDataManagerInputProtocol = DetailProductViewRemoteDataManager()
            let wireFrame: DetailProductViewWireFrameProtocol = DetailProductViewWireFrame()
            
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
        return UIStoryboard(name: "DetailProductViewView", bundle: Bundle.main)
    }
    
}
