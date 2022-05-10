//
//  CategorieEditInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategorieEditInteractor: CategorieEditInteractorInputProtocol {
   
    // MARK: Properties
    weak var presenter: CategorieEditInteractorOutputProtocol?
    var localDatamanager: CategorieEditLocalDataManagerInputProtocol?
    var remoteDatamanager: CategorieEditRemoteDataManagerInputProtocol?
    
    func interactorGetCategorie(_ url: String) {
        remoteDatamanager?.externalGetCategorie(url)
    }
    
    func interactorSaveEditCategorie(id: Int, name: String) {
        remoteDatamanager?.externalSaveEditCategorie(id: id, name: name)
    }
    


}

extension CategorieEditInteractor: CategorieEditRemoteDataManagerOutputProtocol {
   
    
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackCategorie(with categories: Categories) {
        presenter?.interactorPushCategoriePresenter(receivedData: categories)
    }
    
    func remoteDataManagerCallBackEditedCategorie(with edited: Bool) {
        presenter?.interactorPushEditedCategorie(edited: edited)
    }
}
