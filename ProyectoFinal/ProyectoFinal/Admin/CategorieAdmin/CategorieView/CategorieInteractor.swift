//
//  CategorieInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategorieInteractor: CategorieInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CategorieInteractorOutputProtocol?
    var localDatamanager: CategorieLocalDataManagerInputProtocol?
    var remoteDatamanager: CategorieRemoteDataManagerInputProtocol?
    
    func getCategories() {
        remoteDatamanager?.externalGetCategories()
    }

}

extension CategorieInteractor: CategorieRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func remoteDataManagerCallBackCategories(with categories: [Categories]) {
        presenter?.interactorPushCategoriesPresenter(receivedData: categories)
    }
}
