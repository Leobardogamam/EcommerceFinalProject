//
//  SpecificCategoryInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 01/05/22.
//  
//

import Foundation

class SpecificCategoryInteractor: SpecificCategoryInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: SpecificCategoryInteractorOutputProtocol?
    var localDatamanager: SpecificCategoryLocalDataManagerInputProtocol?
    var remoteDatamanager: SpecificCategoryRemoteDataManagerInputProtocol?

    
    func getCategory(id:Int) {
        remoteDatamanager?.getCategory(id: id)
    }
    

}

extension SpecificCategoryInteractor: SpecificCategoryRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func showDataProducts(with product: [Product]) {
        presenter?.showDataProducts(with: product)
    }
}
