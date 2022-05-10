//
//  CategorieAddInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieAddInteractor: CategorieAddInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: CategorieAddInteractorOutputProtocol?
    var localDatamanager: CategorieAddLocalDataManagerInputProtocol?
    var remoteDatamanager: CategorieAddRemoteDataManagerInputProtocol?
    
    func interactorUploadImage(productImage: UIImage) {
        remoteDatamanager?.externalUploadImage(productImage: productImage)
    }
    
    func interactorAddCategorie(name: String, image: String) {
        remoteDatamanager?.externalAddCategorie(name: name, image: image)
    }
    


}

extension CategorieAddInteractor: CategorieAddRemoteDataManagerOutputProtocol {
  
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackImageAdded(with location: String) {
        presenter?.interactorPushImageAdded(receivedData: location)
    }
    
    func remoteDataManagerCallBackProductAdded(added : Bool) {
        presenter?.interactorPushCategorieAdded(added: added)
    }
    
}
