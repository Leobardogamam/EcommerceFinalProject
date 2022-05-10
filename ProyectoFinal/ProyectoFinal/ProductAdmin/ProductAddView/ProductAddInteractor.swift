//
//  ProductAddInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductAddInteractor: ProductAddInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProductAddInteractorOutputProtocol?
    var localDatamanager: ProductAddLocalDataManagerInputProtocol?
    var remoteDatamanager: ProductAddRemoteDataManagerInputProtocol?
    
    func interactorGetCategories() {
        remoteDatamanager?.externalGetCategories()
    }
    
    func interactorUploadImage(productImage: UIImage) {
        remoteDatamanager?.externalUploadImage(productImage: productImage)
    }
    
    func interactorAddProduct(title: String, price: Int, description: String, categoryId: Int, image: String) {
        remoteDatamanager?.externalAddProduct(title: title, price: price, description: description, categoryId: categoryId, image: image)
    }

}

extension ProductAddInteractor: ProductAddRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackCategories(with categories: [Categories]) {
        presenter?.interactorPushCategoriesPresenter(receivedData: categories)
    }
    
    func remoteDataManagerCallBackImageAdded(with location: String) {
        presenter?.interactorPushImageAdded(receivedData: location)
    }
    
    func remoteDataManagerCallBackProductAdded(added : Bool) {
        presenter?.interactorPushProductAdded(added: added)
    }
    
}
