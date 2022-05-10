//
//  MyCardsWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class MyCardsWireFrame: MyCardsWireFrameProtocol {

    class func createMyCardsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MyCardsView")
        if let view = navController.children.first as? MyCardsView {
            let presenter: MyCardsPresenterProtocol & MyCardsInteractorOutputProtocol = MyCardsPresenter()
            let interactor: MyCardsInteractorInputProtocol & MyCardsRemoteDataManagerOutputProtocol = MyCardsInteractor()
            let localDataManager: MyCardsLocalDataManagerInputProtocol = MyCardsLocalDataManager()
            let remoteDataManager: MyCardsRemoteDataManagerInputProtocol = MyCardsRemoteDataManager()
            let wireFrame: MyCardsWireFrameProtocol = MyCardsWireFrame()
            
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
        return UIStoryboard(name: "MyCardsView", bundle: Bundle.main)
    }
    
}
