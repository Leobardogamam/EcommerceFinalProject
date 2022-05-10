//
//  ProductoDetallesInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/3/22.
//  
//

import Foundation

class ProductoDetallesInteractor: ProductoDetallesInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProductoDetallesInteractorOutputProtocol?
    var localDatamanager: ProductoDetallesLocalDataManagerInputProtocol?
    var remoteDatamanager: ProductoDetallesRemoteDataManagerInputProtocol?
    
    func interactorGetProduct(_ url: String) {
        remoteDatamanager?.externalGetProduct(url)
    }
    
    func interactorDeleteProduct(id: Int) {
        remoteDatamanager?.externalDeleteProduct(id: id)
    }
    

}

extension ProductoDetallesInteractor: ProductoDetallesRemoteDataManagerOutputProtocol {
   
    // TODO: Implement use case methods
    func remoteDataManagerCallBackProduct(with producto: Productos) {
        presenter?.interactorPushProductPresenter(receivedProduct: producto)
    }
}
