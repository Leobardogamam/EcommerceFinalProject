//
//  LoginWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//  
//

import Foundation
import UIKit

class LoginWireFrame: LoginWireFrameProtocol {
    
    class func createLoginModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? LoginView {
            let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
            let interactor: LoginInteractorInputProtocol & LoginRemoteDataManagerOutputProtocol = LoginInteractor()
            let localDataManager: LoginLocalDataManagerInputProtocol = LoginLocalDataManager()
            let remoteDataManager: LoginRemoteDataManagerInputProtocol = LoginRemoteDataManager()
            let wireFrame: LoginWireFrameProtocol = LoginWireFrame()
            
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
    
    func presentNewViewSignUp(from view: LoginViewProtocol) {
        
        let newSignUpView = SignupWireFrame.createSignupModule()
        
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(newSignUpView, animated: true)
        }
    }
    
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "LoginView", bundle: Bundle.main)
    }
    
}
