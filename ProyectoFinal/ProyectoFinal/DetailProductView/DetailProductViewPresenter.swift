//
//  DetailProductViewPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class DetailProductViewPresenter: DetailProductViewPresenterProtocol  {
    
    
    
    // MARK: Properties
    weak var view: DetailProductViewViewProtocol?
    var interactor: DetailProductViewInteractorInputProtocol?
    var wireFrame: DetailProductViewWireFrameProtocol?
    var product: Product?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        guard let product = product else {
            return
        }
        view?.getDataProduct(product: product)
    }
    
    func saveDataInCoreData(idCustomer: Int, idProduct: Int) {
        interactor?.saveDataInCoreData(idCustomer: idCustomer, idProduct: idProduct)
    }
}


extension DetailProductViewPresenter: DetailProductViewInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
