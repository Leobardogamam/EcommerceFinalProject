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
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "AddCards")
        if let view = navController as? AddCardsView {
            let presenter: AddCardsPresenterProtocol & AddCardsInteractorOutputProtocol = AddCardsPresenter()
            let interactor: AddCardsInteractorInputProtocol & AddCardsRemoteDataManagerOutputProtocol & AddCardsLocalDataManagerOutputProtocol = AddCardsInteractor()
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
            localDataManager.localRequestHandler = interactor
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "AddCards", bundle: Bundle.main)
    }
    
    func presentNewViewCards(from view: AddCardsViewProtocol) {
        let newDetailView = MyCardsWireFrame.createMyCardsModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    

    
}
