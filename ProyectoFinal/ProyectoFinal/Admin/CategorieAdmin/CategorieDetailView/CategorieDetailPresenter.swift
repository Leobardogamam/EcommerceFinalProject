//
//  CategorieDetailPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategorieDetailPresenter: CategorieDetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: CategorieDetailViewProtocol?
    var interactor: CategorieDetailInteractorInputProtocol?
    var wireFrame: CategorieDetailWireFrameProtocol?
    
    var dataReceived : String?
    
    func viewDidLoad() {
        interactor?.interactorGetCategorie("https://api.escuelajs.co/api/v1/categories/\(String(describing: dataReceived!))")
    }
    
    func showEditCategorieView(with data: String) {
        wireFrame?.presentNewViewCategorieEdit(from: view!, withData: data)
    }
    
}



extension CategorieDetailPresenter: CategorieDetailInteractorOutputProtocol {
  
    
    // TODO: implement interactor output methods
    
    func interactorPushCategorie(receivedCategorie: Categories) {
        view?.presenterGetCategories(receivedCategorie: receivedCategorie)
    }
    
}
