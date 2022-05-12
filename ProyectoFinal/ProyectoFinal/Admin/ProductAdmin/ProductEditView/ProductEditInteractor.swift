//
//  ProductEditInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class ProductEditInteractor: ProductEditInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProductEditInteractorOutputProtocol?
    var localDatamanager: ProductEditLocalDataManagerInputProtocol?
    var remoteDatamanager: ProductEditRemoteDataManagerInputProtocol?
    
    func interactorGetProduct(_ url: String) {
        remoteDatamanager?.externalGetProduct(url)
    }
    
    func interactorSaveEditProduct(id: Int, title: String, price: Int) {
        remoteDatamanager?.externalSaveEditProduct(id: id, title: title, price: price)
    }


}

extension ProductEditInteractor: ProductEditRemoteDataManagerOutputProtocol {
   
    
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackProduct(with producto: Products) {
        presenter?.interactorPushProductPresenter(receivedProduct: producto)
    }
    
    func remoteDataManagerCallBackEditedProduct(edited: Bool) {
        presenter?.interactorPushEditedProductPresenter(edited: edited)
    }
}
