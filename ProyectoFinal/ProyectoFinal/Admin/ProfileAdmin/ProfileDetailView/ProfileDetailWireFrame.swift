//
//  ProfileDetailWireFrame.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

class ProfileDetailWireFrame: ProfileDetailWireFrameProtocol {

    class func createProfileDetailModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileDetailView")
        if let view = viewController as? ProfileDetailView {
            let presenter: ProfileDetailPresenterProtocol & ProfileDetailInteractorOutputProtocol = ProfileDetailPresenter()
            let interactor: ProfileDetailInteractorInputProtocol & ProfileDetailRemoteDataManagerOutputProtocol = ProfileDetailInteractor()
            let localDataManager: ProfileDetailLocalDataManagerInputProtocol = ProfileDetailLocalDataManager()
            let remoteDataManager: ProfileDetailRemoteDataManagerInputProtocol = ProfileDetailRemoteDataManager()
            let wireFrame: ProfileDetailWireFrameProtocol = ProfileDetailWireFrame()
            
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
        return UIStoryboard(name: "ProfileDetailView", bundle: Bundle.main)
    }
    
}
