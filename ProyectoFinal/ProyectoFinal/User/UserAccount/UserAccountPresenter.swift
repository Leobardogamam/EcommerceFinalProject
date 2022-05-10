//
//  UserAccountPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class UserAccountPresenter  {
    
    // MARK: Properties
    weak var view: UserAccountViewProtocol?
    var interactor: UserAccountInteractorInputProtocol?
    var wireFrame: UserAccountWireFrameProtocol?
    
}

extension UserAccountPresenter: UserAccountPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func showViewProfile() {
        wireFrame?.showViewProfile(from: self.view!)
    }
    
    func showMyCards() {
        wireFrame?.showMyCards(from: self.view!)
    }
    
    func showViewPurchases() {
        wireFrame?.showViewPurchases(from: self.view!)
    }
    
    
    func showLoginView() {
        wireFrame?.showLoginView(from: view!)
    }
    func showHomeView() {
        wireFrame?.showHomeView(from: view!)
    }
    
    func showShopingCart() {
        wireFrame?.showShopingCart(from: view!)
    }
    
    
}

extension UserAccountPresenter: UserAccountInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
