//
//  UserAccountWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class UserAccountWireFrame: UserAccountWireFrameProtocol {

    class func createUserAccountModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "UserAccountView")
        if let view = viewController as? UserAccountView {
            let presenter: UserAccountPresenterProtocol & UserAccountInteractorOutputProtocol = UserAccountPresenter()
            let interactor: UserAccountInteractorInputProtocol & UserAccountRemoteDataManagerOutputProtocol = UserAccountInteractor()
            let localDataManager: UserAccountLocalDataManagerInputProtocol = UserAccountLocalDataManager()
            let remoteDataManager: UserAccountRemoteDataManagerInputProtocol = UserAccountRemoteDataManager()
            let wireFrame: UserAccountWireFrameProtocol = UserAccountWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "UserAccount", bundle: Bundle.main)
    }
    
}
