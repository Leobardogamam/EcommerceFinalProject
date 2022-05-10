//
//  CategorieEditPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategorieEditPresenter: CategorieEditPresenterProtocol  {
   
   
    // MARK: Properties
    weak var view: CategorieEditViewProtocol?
    var interactor: CategorieEditInteractorInputProtocol?
    var wireFrame: CategorieEditWireFrameProtocol?
    var dataReceived : String?
    
    func viewDidLoad() {
        interactor?.interactorGetCategorie("https://api.escuelajs.co/api/v1/categories/\(String(describing: dataReceived!))")
    }
    
    func presenterSaveEditCategorie(id: Int, name: String) {
        interactor?.interactorSaveEditCategorie(id: id, name: name)
    }
    
    func showCategorieView() {
        wireFrame?.presentNewViewCategorie(from: view!)
    }
    
    
}


extension CategorieEditPresenter: CategorieEditInteractorOutputProtocol {
    
    
    // TODO: implement interactor output methods
    
    func interactorPushCategoriePresenter(receivedData: Categories) {
        view?.presenterGetCategorie(receivedCategorie: receivedData)
    }
    
    func interactorPushEditedCategorie(edited: Bool) {
        view?.presenterShowAlert(edited: edited)
    }
}
