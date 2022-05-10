//
//  ProductDetailInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class ProductDetailInteractor: ProductDetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProductDetailInteractorOutputProtocol?
    var localDatamanager: ProductDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: ProductDetailRemoteDataManagerInputProtocol?
    
    func interactorGetProduct(_ url: String) {
        remoteDatamanager?.externalGetProduct(url)
    }
    
    func interactorDeleteProduct(id: Int) {
        remoteDatamanager?.externalDeleteProduct(id: id)
    }

}

extension ProductDetailInteractor: ProductDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackProduct(with producto: Products) {
        presenter?.interactorPushProductPresenter(receivedProduct: producto)
    }
}
