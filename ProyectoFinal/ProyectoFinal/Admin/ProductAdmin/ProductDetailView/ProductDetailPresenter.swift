//
//  ProductDetailPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class ProductDetailPresenter: ProductDetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: ProductDetailViewProtocol?
    var interactor: ProductDetailInteractorInputProtocol?
    var wireFrame: ProductDetailWireFrameProtocol?
    
    var dataReceived: String?
    
    func viewDidLoad() {
        interactor?.interactorGetProduct("https://api.escuelajs.co/api/v1/products/\(String(describing: dataReceived!))")
    }
    
    func showEditProductView(with data: String) {
        wireFrame?.presentNewEditView(from: view!, withData: dataReceived!)
    }
    
    func deleteProduct(with id: Int) {
        interactor?.interactorDeleteProduct(id: id)
    }
    
    func showProductView() {
        wireFrame?.presentNewViewProduct(from: view!)
    }
    
}


extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interactorPushProductPresenter(receivedProduct: Products) {
        view?.presenterGetProductView(receivedProduct: receivedProduct)
    }
}
