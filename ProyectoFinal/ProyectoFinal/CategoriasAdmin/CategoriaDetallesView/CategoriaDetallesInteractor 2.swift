//
//  CategoriaDetallesInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/4/22.
//  
//

import Foundation

class CategoriaDetallesInteractor: CategoriaDetallesInteractorInputProtocol {
  
    
   
    // MARK: Properties
    weak var presenter: CategoriaDetallesInteractorOutputProtocol?
    var localDatamanager: CategoriaDetallesLocalDataManagerInputProtocol?
    var remoteDatamanager: CategoriaDetallesRemoteDataManagerInputProtocol?

    func interactorGetCategorie(_ url: String) {
        remoteDatamanager?.externalGetCategories(url)
    }
    

}

extension CategoriaDetallesInteractor: CategoriaDetallesRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackCategorie(with categorie: Categorias) {
        presenter?.interactorPushProductCategorie(receivedCategorie: categorie)
    }
}
