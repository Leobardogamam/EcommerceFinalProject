//
//  CardsWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class CardsWireFrame: CardsWireFrameProtocol {

    class func createCardsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "CardsView")
        if let view = navController.children.first as? CardsView {
            let presenter: CardsPresenterProtocol & CardsInteractorOutputProtocol = CardsPresenter()
            let interactor: CardsInteractorInputProtocol & CardsRemoteDataManagerOutputProtocol = CardsInteractor()
            let localDataManager: CardsLocalDataManagerInputProtocol = CardsLocalDataManager()
            let remoteDataManager: CardsRemoteDataManagerInputProtocol = CardsRemoteDataManager()
            let wireFrame: CardsWireFrameProtocol = CardsWireFrame()
            
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
        return UIStoryboard(name: "CardsView", bundle: Bundle.main)
    }
    
}
