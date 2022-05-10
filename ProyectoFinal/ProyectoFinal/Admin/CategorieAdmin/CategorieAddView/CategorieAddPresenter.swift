//
//  CategorieAddPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieAddPresenter  {
    
    // MARK: Properties
    weak var view: CategorieAddViewProtocol?
    var interactor: CategorieAddInteractorInputProtocol?
    var wireFrame: CategorieAddWireFrameProtocol?
    
}

extension CategorieAddPresenter: CategorieAddPresenterProtocol {
   
   
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func addImage(productImage: UIImage) {
        interactor?.interactorUploadImage(productImage: productImage)
    }
    
    func addCategorie(name: String, image: String) {
        interactor?.interactorAddCategorie(name: name, image: image)
    }
    
    func showCategorieView() {
        wireFrame?.presentNewViewCategorie(from: view!)
    }
    
    
}

extension CategorieAddPresenter: CategorieAddInteractorOutputProtocol {
   
    // TODO: implement interactor output methods
    
    func interactorPushImageAdded(receivedData: String) {
        view?.presenterPushImageAdded(location: receivedData)
    }
    
    func interactorPushCategorieAdded(added : Bool) {
        view?.presenterPushCategorieAdded(added: added)
    }
    
}
