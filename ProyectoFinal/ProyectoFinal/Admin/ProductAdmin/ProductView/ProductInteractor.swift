//
//  ProductInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class ProductInteractor: ProductInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProductInteractorOutputProtocol?
    var localDatamanager: ProductLocalDataManagerInputProtocol?
    var remoteDatamanager: ProductRemoteDataManagerInputProtocol?
    
    func getProducts() {
        remoteDatamanager?.externalGetProducts()
    }

}

extension ProductInteractor: ProductRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackProducts(with products: [Products]) {
        presenter?.interactorPushProductsPresenter(receivedProducts: products)
    }
}
