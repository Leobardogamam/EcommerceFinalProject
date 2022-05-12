//
//  ProductEditPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class ProductEditPresenter: ProductEditPresenterProtocol {
    
    // MARK: Properties
    weak var view: ProductEditViewProtocol?
    var interactor: ProductEditInteractorInputProtocol?
    var wireFrame: ProductEditWireFrameProtocol?
    
    var dataReceived: String?
    
    func viewDidLoad() {
        interactor?.interactorGetProduct("https://api.escuelajs.co/api/v1/products/\(String(describing: dataReceived!))")
    }
    
    func presenterSaveEditProduct(id: Int, title: String, price: Int) {
        interactor?.interactorSaveEditProduct(id: id, title: title, price: price)
    }
    
    func showProductView() {
        wireFrame?.presentNewViewProduct(from: view!)
    }
    
}


extension ProductEditPresenter: ProductEditInteractorOutputProtocol {
   
    
    // TODO: implement interactor output methods
    
    func interactorPushProductPresenter(receivedProduct: Products) {
        view?.presenterGetProductView(receivedProduct: receivedProduct)
    }
    
    func interactorPushEditedProductPresenter(edited: Bool) {
        view?.presenterGetEditedProduct(edited: edited)
    }
}
