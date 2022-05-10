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

    class func createDetailProductViewModule(product:Product) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailProductView")
        if let view = viewController as? DetailProductViewView {
            let presenter: DetailProductViewPresenterProtocol & DetailProductViewInteractorOutputProtocol = DetailProductViewPresenter()
            let interactor: DetailProductViewInteractorInputProtocol & DetailProductViewRemoteDataManagerOutputProtocol = DetailProductViewInteractor()
            let localDataManager: DetailProductViewLocalDataManagerInputProtocol = DetailProductViewLocalDataManager()
            let remoteDataManager: DetailProductViewRemoteDataManagerInputProtocol = DetailProductViewRemoteDataManager()
            let wireFrame: DetailProductViewWireFrameProtocol = DetailProductViewWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.product = product
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
        return UIStoryboard(name: "DetailProductView", bundle: Bundle.main)
    }
    
}
