//
//  ViewPurchasesInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class ViewPurchasesInteractor: ViewPurchasesInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ViewPurchasesInteractorOutputProtocol?
    var localDatamanager: ViewPurchasesLocalDataManagerInputProtocol?
    var remoteDatamanager: ViewPurchasesRemoteDataManagerInputProtocol?

}

extension ViewPurchasesInteractor: ViewPurchasesRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
