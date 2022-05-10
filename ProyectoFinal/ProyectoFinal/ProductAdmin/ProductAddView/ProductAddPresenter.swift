//
//  ProductAddPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductAddPresenter: ProductAddPresenterProtocol  {
    
    // MARK: Properties
    weak var view: ProductAddViewProtocol?
    var interactor: ProductAddInteractorInputProtocol?
    var wireFrame: ProductAddWireFrameProtocol?
    
    func viewDidLoad() {
        interactor?.interactorGetCategories()
    }
    
    func addImage(productImage: UIImage) {
        interactor?.interactorUploadImage(productImage: productImage)
    }
    
    
    func addProduct(title: String, price: Int, description: String, categoryId: Int, image: String) {
        interactor?.interactorAddProduct(title: title, price: price, description: description, categoryId: categoryId, image: image)
    }
    
    func showProductView() {
        wireFrame?.presentNewViewProduct(from: view!)
    }
    
    
}


extension ProductAddPresenter: ProductAddInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    
    func interactorPushCategoriesPresenter(receivedData: [Categories]) {
        view?.presenterPushCategoriesView(receivedData: receivedData)
    }
    
    func interactorPushImageAdded(receivedData: String) {
        view?.presenterPushImageAdded(location: receivedData)
    }
    
    func interactorPushProductAdded(added : Bool) {
        view?.presenterPushProductAdded(added: added)
    }
}
