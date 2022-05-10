//
//  ProductosAddPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/3/22.
//  
//

import Foundation
import UIKit

class ProductosAddPresenter : ProductosAddPresenterProtocol  {
    
   
   
    // MARK: Properties
    weak var view: ProductosAddViewProtocol?
    var interactor: ProductosAddInteractorInputProtocol?
    var wireFrame: ProductosAddWireFrameProtocol?
    

    
    // TODO: implement presenter methods
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


extension ProductosAddPresenter: ProductosAddInteractorOutputProtocol {
    
    // TODO: implement interactor output methods
    
    func interactorPushCategoriesPresenter(receivedData: [Categorias]) {
        view?.presenterPushCategoriesView(receivedData: receivedData)
    }
    
    func interactorPushImageAdded(receivedData: String) {
        view?.presenterPushImageAdded(location: receivedData)
    }
    
    func interactorPushProductAdded() {
        view?.presenterPushProductAdded()
    }
}
