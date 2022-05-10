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

}

extension DetailProductViewInteractor: DetailProductViewRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
