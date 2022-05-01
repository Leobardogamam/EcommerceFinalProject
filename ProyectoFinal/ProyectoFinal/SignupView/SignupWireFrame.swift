//
//  SignupWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation
import UIKit

class SignupWireFrame: SignupWireFrameProtocol {

    class func createSignupModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SignupView")
        if let view = viewController as? SignupView {
            let presenter: SignupPresenterProtocol & SignupInteractorOutputProtocol = SignupPresenter()
            let interactor: SignupInteractorInputProtocol & SignupRemoteDataManagerOutputProtocol = SignupInteractor()
            let localDataManager: SignupLocalDataManagerInputProtocol = SignupLocalDataManager()
            let remoteDataManager: SignupRemoteDataManagerInputProtocol = SignupRemoteDataManager()
            let wireFrame: SignupWireFrameProtocol = SignupWireFrame()
            
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
        return UIStoryboard(name: "SignupView", bundle: Bundle.main)
    }
    
}
