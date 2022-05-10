//
//  ShopingCarInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class ShopingCarInteractor: ShopingCarInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ShopingCarInteractorOutputProtocol?
    var localDatamanager: ShopingCarLocalDataManagerInputProtocol?
    var remoteDatamanager: ShopingCarRemoteDataManagerInputProtocol?

}

extension ShopingCarInteractor: ShopingCarRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
