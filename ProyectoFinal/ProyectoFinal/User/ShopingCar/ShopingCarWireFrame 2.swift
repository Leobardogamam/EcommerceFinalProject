//
//  ShopingCarWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ShopingCarWireFrame: ShopingCarWireFrameProtocol {

    class func createShopingCarModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ShopingCarView")
        if let view = navController.children.first as? ShopingCarView {
            let presenter: ShopingCarPresenterProtocol & ShopingCarInteractorOutputProtocol = ShopingCarPresenter()
            let interactor: ShopingCarInteractorInputProtocol & ShopingCarRemoteDataManagerOutputProtocol = ShopingCarInteractor()
            let localDataManager: ShopingCarLocalDataManagerInputProtocol = ShopingCarLocalDataManager()
            let remoteDataManager: ShopingCarRemoteDataManagerInputProtocol = ShopingCarRemoteDataManager()
            let wireFrame: ShopingCarWireFrameProtocol = ShopingCarWireFrame()
            
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
        return UIStoryboard(name: "ShopingCarView", bundle: Bundle.main)
    }
    
}
