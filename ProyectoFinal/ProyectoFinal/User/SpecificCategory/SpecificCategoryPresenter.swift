//
//  SpecificCategoryPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 01/05/22.
//  
//

import Foundation

class SpecificCategoryPresenter: SpecificCategoryPresenterProtocol {
    
    
    // MARK: Properties
    weak var view: SpecificCategoryViewProtocol?
    var interactor: SpecificCategoryInteractorInputProtocol?
    var wireFrame: SpecificCategoryWireFrameProtocol?
    var id: Int?
    var name: String?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        if (id == nil){
            print("No llegaron los datos")
        }else{
            print("este es el id \(self.id!)")
            interactor?.getCategory(id: id!)
            view?.sendNameCategory(name: name ?? "Error")
        }
    }
    
    func showDetailProduct(product: Product) {
        wireFrame?.showDetailProductView(from: view!, product: product)
    }
    
    
}

extension SpecificCategoryPresenter: SpecificCategoryInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func showDataProducts(with product:[Product]){
        view?.showDataProducts(with: product)
    }
}
