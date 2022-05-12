//
//  DeleteEditCardsWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class DeleteEditCardsWireFrame: DeleteEditCardsWireFrameProtocol {
   

    class func createDeleteEditCardsModule(data : String) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "DeleteEditCardsView")
        if let view = navController as? DeleteEditCardsView {
            let presenter: DeleteEditCardsPresenterProtocol & DeleteEditCardsInteractorOutputProtocol = DeleteEditCardsPresenter()
            let interactor: DeleteEditCardsInteractorInputProtocol & DeleteEditCardsRemoteDataManagerOutputProtocol & DeleteEditCardsLocalDataManagerOutputProtocol = DeleteEditCardsInteractor()
            let localDataManager: DeleteEditCardsLocalDataManagerInputProtocol = DeleteEditCardsLocalDataManager()
            let remoteDataManager: DeleteEditCardsRemoteDataManagerInputProtocol = DeleteEditCardsRemoteDataManager()
            let wireFrame: DeleteEditCardsWireFrameProtocol = DeleteEditCardsWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.numSerie = data
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            localDataManager.localRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DeleteEditCards", bundle: Bundle.main)
    }
    
    func presentNewEditCards(from view: DeleteEditCardsViewProtocol, data: String) {
        let newDetailView = EditCardViewWireFrame.createEditCardViewModule(data: data)
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    
    
}
