//
//  ViewPurchasesWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ViewPurchasesWireFrame: ViewPurchasesWireFrameProtocol {

    class func createViewPurchasesModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ViewPurchases")
        if let view = navController as? ViewPurchasesView {
            let presenter: ViewPurchasesPresenterProtocol & ViewPurchasesInteractorOutputProtocol = ViewPurchasesPresenter()
            let interactor: ViewPurchasesInteractorInputProtocol & ViewPurchasesRemoteDataManagerOutputProtocol & ViewPurchasesLocalDataManagerOutputProtocol = ViewPurchasesInteractor()
            let localDataManager: ViewPurchasesLocalDataManagerInputProtocol = ViewPurchasesLocalDataManager()
            let remoteDataManager: ViewPurchasesRemoteDataManagerInputProtocol = ViewPurchasesRemoteDataManager()
            let wireFrame: ViewPurchasesWireFrameProtocol = ViewPurchasesWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
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
        return UIStoryboard(name: "ViewPurchases", bundle: Bundle.main)
    }
    
}
