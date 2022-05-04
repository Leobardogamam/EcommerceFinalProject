//
//  DetailProductViewInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class DetailProductViewInteractor: DetailProductViewInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: DetailProductViewInteractorOutputProtocol?
    var localDatamanager: DetailProductViewLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailProductViewRemoteDataManagerInputProtocol?

    func saveDataInCoreData(idCustomer: Int, idProduct: Int) {
        localDatamanager?.saveDataInCoreData(idCustomer: idCustomer, idProduct: idProduct)
    }

}

extension DetailProductViewInteractor: DetailProductViewRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
