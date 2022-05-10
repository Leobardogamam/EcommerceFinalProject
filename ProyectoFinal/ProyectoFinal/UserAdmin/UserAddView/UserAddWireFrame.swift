//
//  UserAddWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

class UserAddWireFrame: UserAddWireFrameProtocol {
  
    class func createUserAddModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "UserAddView")
        if let view = viewController as? UserAddView {
            let presenter: UserAddPresenterProtocol & UserAddInteractorOutputProtocol = UserAddPresenter()
            let interactor: UserAddInteractorInputProtocol & UserAddRemoteDataManagerOutputProtocol = UserAddInteractor()
            let localDataManager: UserAddLocalDataManagerInputProtocol = UserAddLocalDataManager()
            let remoteDataManager: UserAddRemoteDataManagerInputProtocol = UserAddRemoteDataManager()
            let wireFrame: UserAddWireFrameProtocol = UserAddWireFrame()
            
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
        return UIStoryboard(name: "UserAddView", bundle: Bundle.main)
    }
    
    func presentNewViewUser(from view: UserAddViewProtocol) {
        let newDetailView = UserWireFrame.createUserModule()
        
        if let newView = view as? UIViewController{
            newView.present(newDetailView, animated: true)
        }
    }
    

    
}
