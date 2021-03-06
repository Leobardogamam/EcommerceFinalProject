//
//  HomeViewPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class HomeViewPresenter:  HomeViewPresenterProtocol {
    
   
    
    // MARK: Properties
    weak var view: HomeViewViewProtocol?
    var interactor: HomeViewInteractorInputProtocol?
    var wireFrame: HomeViewWireFrameProtocol?
    var user: Users?
    var defaults = UserDefaults()
    var noUser: Int?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getCategoriesData()
//        print("El usuario es: ", defaults.integer(forKey: "IdUsuario"))
    }
    func showSpecifcCategory(id: Int, name:String) {
        wireFrame?.showSpecificCategory(from: view!, id: id, name: name)
    }
    
    func showDetailProductView(product: Product) {
        wireFrame?.showDetailProduct(from: view!, product: product)
    }
    
    func showUserAccount() {
        wireFrame?.showUserAccount(from: view!)
    }
    
    func showShopingCart() {
        wireFrame?.showShopingCart(from: view!)
    }
    
    func showShopingCart(noUser: Int) {
        wireFrame?.showShopingCartWithoutUser(from: view!, noUser: noUser)
    }
    
    func deleteCarWithoutUser() {
        interactor?.deleteCarWithoutUser()
    }
   
}

extension HomeViewPresenter: HomeViewInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func pushData(with data: [Categories]) {
        view?.pushData(with: data)
    }
    
}
