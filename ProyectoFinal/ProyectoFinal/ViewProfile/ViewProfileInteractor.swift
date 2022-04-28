//
//  ViewProfileInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class ViewProfileInteractor: ViewProfileInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ViewProfileInteractorOutputProtocol?
    var localDatamanager: ViewProfileLocalDataManagerInputProtocol?
    var remoteDatamanager: ViewProfileRemoteDataManagerInputProtocol?

}

extension ViewProfileInteractor: ViewProfileRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
