//
//  ProductPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class ProductPresenter: ProductPresenterProtocol {
  
    
    
    // MARK: Properties
    weak var view: ProductViewProtocol?
    var interactor: ProductInteractorInputProtocol?
    var wireFrame: ProductWireFrameProtocol?
    
    var user: Users?
    
    func viewDidLoad() {
        view?.loadActivity()
        interactor?.getProducts()
    }
    
    func showDetailProductView(with data: String) {
        wireFrame?.presentNewViewProductDetail(from: view!, withData: data)
    }
    
    func showAddProductView() {
        wireFrame?.presentNewViewAddProduct(from: view!)
    }
    
    func showCategorieView() {
        wireFrame?.presentNewViewCategorie(from: view!)
    }
    
    func showUserView() {
        wireFrame?.presentNewViewUser(from: view!)
    }
    
    func showProfileView() {
        wireFrame?.presentNewViewProfile(from: view!)
    }
    
    
}


extension ProductPresenter: ProductInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interactorPushProductsPresenter(receivedProducts: [Products]) {
        view?.stopAndHideActivity()
        view?.presenterGetProducts(receivedProducts: receivedProducts)
    }
}
