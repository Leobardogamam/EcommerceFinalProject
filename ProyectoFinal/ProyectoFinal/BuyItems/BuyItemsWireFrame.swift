//
//  BuyItemsWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class BuyItemsWireFrame: BuyItemsWireFrameProtocol {

    class func createBuyItemsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "buyItems")
        if let view = navController as? BuyItemsView {
            let presenter: BuyItemsPresenterProtocol & BuyItemsInteractorOutputProtocol = BuyItemsPresenter()
            let interactor: BuyItemsInteractorInputProtocol & BuyItemsRemoteDataManagerOutputProtocol = BuyItemsInteractor()
            let localDataManager: BuyItemsLocalDataManagerInputProtocol = BuyItemsLocalDataManager()
            let remoteDataManager: BuyItemsRemoteDataManagerInputProtocol = BuyItemsRemoteDataManager()
            let wireFrame: BuyItemsWireFrameProtocol = BuyItemsWireFrame()
            
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
        return UIStoryboard(name: "BuyItems", bundle: Bundle.main)
    }
    
    
    func showAddCards(from view: BuyItemsViewProtocol) {
        let newView = AddCardsWireFrame.createAddCardsModule()
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
    }
    
}
