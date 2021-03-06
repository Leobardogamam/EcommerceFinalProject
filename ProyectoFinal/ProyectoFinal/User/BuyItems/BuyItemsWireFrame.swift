//
//  BuyItemsWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

class BuyItemsWireFrame: BuyItemsWireFrameProtocol {
    func returnLocalDataCreditCar(cards: [NSManagedObject]) {
        
    }
    
    
    

    class func createBuyItemsModule(price:Int) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "buyItems")
        if let view = navController as? BuyItemsView {
            let presenter: BuyItemsPresenterProtocol & BuyItemsInteractorOutputProtocol = BuyItemsPresenter()
            let interactor: BuyItemsInteractorInputProtocol & BuyItemsRemoteDataManagerOutputProtocol & BuyItemsLocalDataDataManagerOutputProtocol = BuyItemsInteractor()
            let localDataManager: BuyItemsLocalDataManagerInputProtocol  = BuyItemsLocalDataManager()
            let remoteDataManager: BuyItemsRemoteDataManagerInputProtocol = BuyItemsRemoteDataManager()
            let wireFrame: BuyItemsWireFrameProtocol = BuyItemsWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.precio = price
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            localDataManager.LocalRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "BuyItems", bundle: Bundle.main)
    }
    
    func showAddCards(from view: BuyItemsViewProtocol) {
        let newView = AddCardsWireFrame.createAddCardsModule()
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
    }
    
    func showShopingCar(from view: BuyItemsViewProtocol) {
        let newView = ShopingCarWireFrame.createShopingCarModule()
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
    }
    
}
