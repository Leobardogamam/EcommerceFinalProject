//
//  EditCardViewWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/12/22.
//  
//

import Foundation
import UIKit

class EditCardViewWireFrame: EditCardViewWireFrameProtocol {

    class func createEditCardViewModule(data : String) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "EditCardViewView")
        if let view = navController as? EditCardViewView {
            let presenter: EditCardViewPresenterProtocol & EditCardViewInteractorOutputProtocol = EditCardViewPresenter()
            let interactor: EditCardViewInteractorInputProtocol & EditCardViewRemoteDataManagerOutputProtocol & EditCardViewLocalDataManagerOutputProtocol = EditCardViewInteractor()
            let localDataManager: EditCardViewLocalDataManagerInputProtocol = EditCardViewLocalDataManager()
            let remoteDataManager: EditCardViewRemoteDataManagerInputProtocol = EditCardViewRemoteDataManager()
            let wireFrame: EditCardViewWireFrameProtocol = EditCardViewWireFrame()
            
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
        return UIStoryboard(name: "EditCardView", bundle: Bundle.main)
    }
    
}
