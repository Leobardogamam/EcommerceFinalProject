//
//  HomeViewWireFrame.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class HomeViewWireFrame: HomeViewWireFrameProtocol {
    
    static func createHomeViewModule(user: Users) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "homeView")
        if let view = navController as? HomeViewView {
            let userDefault = UserDefaults()
            let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputProtocol = HomeViewPresenter()
            let interactor: HomeViewInteractorInputProtocol & HomeViewRemoteDataManagerOutputProtocol & HomeViewLocalDataManagerOutputProtocol = HomeViewInteractor()
            let localDataManager: HomeViewLocalDataManagerInputProtocol = HomeViewLocalDataManager()
            let remoteDataManager: HomeViewRemoteDataManagerInputProtocol = HomeViewRemoteDataManager()
            let wireFrame: HomeViewWireFrameProtocol = HomeViewWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.user = user
            
            //Encodeamos el user y lo seteamos en userDefaults
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(user) {
                let defaults = UserDefaults.standard
                defaults.set(encoded, forKey: "UserLogged")
            }
            
            //Traemos el user de userDefaults y lo desencodeamos
            if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
                let decoder = JSONDecoder()
                if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                    print(loadedPerson.name)
                }
            }
            
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            localDataManager.localRequestHandler = interactor
            remoteDataManager.remoteRequestHandler = interactor
            return navController
        }
        return UIViewController()
    }
    
    
    class func createHomeViewModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "homeView")
        if let view = navController as? HomeViewView {
            let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputProtocol = HomeViewPresenter()
            let interactor: HomeViewInteractorInputProtocol & HomeViewRemoteDataManagerOutputProtocol = HomeViewInteractor()
            let localDataManager: HomeViewLocalDataManagerInputProtocol = HomeViewLocalDataManager()
            let remoteDataManager: HomeViewRemoteDataManagerInputProtocol = HomeViewRemoteDataManager()
            let wireFrame: HomeViewWireFrameProtocol = HomeViewWireFrame()
            
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
    
    class func createHomeViewModule(user : Int) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "homeView")
        if let view = navController as? HomeViewView {
            let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputProtocol = HomeViewPresenter()
            let interactor: HomeViewInteractorInputProtocol & HomeViewRemoteDataManagerOutputProtocol = HomeViewInteractor()
            let localDataManager: HomeViewLocalDataManagerInputProtocol = HomeViewLocalDataManager()
            let remoteDataManager: HomeViewRemoteDataManagerInputProtocol = HomeViewRemoteDataManager()
            let wireFrame: HomeViewWireFrameProtocol = HomeViewWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.noUser = user
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    
    func showSpecificCategory(from view: HomeViewViewProtocol, id: Int, name:String) {
        if let newView = view as? UIViewController{
            newView.present(SpecificCategoryWireFrame.createSpecificCategoryModule(with: id, name: name),animated:true)
        }
    }
    func showDetailProduct(from view: HomeViewViewProtocol, product: Product) {
        if let newView = view as? UIViewController{
            newView.modalPresentationStyle = .automatic
            newView.present(DetailProductViewWireFrame.createDetailProductViewModule(product: product),animated:true)
        }
    }
    
    func showShopingCart(from view: HomeViewViewProtocol) {
        let newView = ShopingCarWireFrame.createShopingCarModule()
        
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
    }
    
    func showUserAccount(from view: HomeViewViewProtocol) {
        let newView = UserAccountWireFrame.createUserAccountModule()
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
    }
    
    func showShopingCartWithoutUser(from view: HomeViewViewProtocol, noUser: Int) {
        let newView = ShopingCarWireFrame.createShopingCarModule(noUser: noUser)
        
        if let view = view as? UIViewController{
            view.present(newView, animated: true)
        }
    }
    
   
    
}
