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

    class func createDeleteEditCardsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "DeleteEditCardsView")
        if let view = navController.children.first as? DeleteEditCardsView {
            let presenter: DeleteEditCardsPresenterProtocol & DeleteEditCardsInteractorOutputProtocol = DeleteEditCardsPresenter()
            let interactor: DeleteEditCardsInteractorInputProtocol & DeleteEditCardsRemoteDataManagerOutputProtocol = DeleteEditCardsInteractor()
            let localDataManager: DeleteEditCardsLocalDataManagerInputProtocol = DeleteEditCardsLocalDataManager()
            let remoteDataManager: DeleteEditCardsRemoteDataManagerInputProtocol = DeleteEditCardsRemoteDataManager()
            let wireFrame: DeleteEditCardsWireFrameProtocol = DeleteEditCardsWireFrame()
            
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
        return UIStoryboard(name: "DeleteEditCardsView", bundle: Bundle.main)
    }
    
}
