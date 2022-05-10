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
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ShopingCar")
        if let view = navController as? ShopingCarView {
            let presenter: ShopingCarPresenterProtocol & ShopingCarInteractorOutputProtocol = ShopingCarPresenter()
            let interactor: ShopingCarInteractorInputProtocol & ShopingCarRemoteDataManagerOutputProtocol & ShopingCarLocalDataManagerOutputProtocol  = ShopingCarInteractor()
            let localDataManager: ShopingCarLocalDataManagerInputProtocol = ShopingCarLocalDataManager()
            let remoteDataManager: ShopingCarRemoteDataManagerInputProtocol = ShopingCarRemoteDataManager()
            let wireFrame: ShopingCarWireFrameProtocol = ShopingCarWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            localDataManager.interactor = interactor
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ShopingCar", bundle: Bundle.main)
    }
    
    func showUserAccount(from view: ShopingCarViewProtocol) {
        let newView = UserAccountWireFrame.createUserAccountModule()
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
        
        
    }
    
    func showViewHome(from view: ShopingCarViewProtocol) {
        let newView = HomeViewWireFrame.createHomeViewModule()
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
    }
    
    
    func showBuyItems(from view: ShopingCarViewProtocol) {
        let newView = BuyItemsWireFrame.createBuyItemsModule()
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
    }
    
    
}
