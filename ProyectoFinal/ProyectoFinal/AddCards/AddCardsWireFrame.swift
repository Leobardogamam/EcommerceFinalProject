//
//  AddCardsWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class AddCardsWireFrame: AddCardsWireFrameProtocol {

    class func createAddCardsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "AddCardsView")
        if let view = navController.children.first as? AddCardsView {
            let presenter: AddCardsPresenterProtocol & AddCardsInteractorOutputProtocol = AddCardsPresenter()
            let interactor: AddCardsInteractorInputProtocol & AddCardsRemoteDataManagerOutputProtocol = AddCardsInteractor()
            let localDataManager: AddCardsLocalDataManagerInputProtocol = AddCardsLocalDataManager()
            let remoteDataManager: AddCardsRemoteDataManagerInputProtocol = AddCardsRemoteDataManager()
            let wireFrame: AddCardsWireFrameProtocol = AddCardsWireFrame()
            
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
        return UIStoryboard(name: "AddCardsView", bundle: Bundle.main)
    }
    
}
