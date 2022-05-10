//
//  CategorieDetailInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategorieDetailInteractor: CategorieDetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CategorieDetailInteractorOutputProtocol?
    var localDatamanager: CategorieDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: CategorieDetailRemoteDataManagerInputProtocol?
    
    
    func interactorGetCategorie(_ url: String) {
        remoteDatamanager?.externalGetCategories(url)
    }

}

extension CategorieDetailInteractor: CategorieDetailRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackCategorie(with categorie: Categories) {
        presenter?.interactorPushCategorie(receivedCategorie: categorie)
    }
    
}
