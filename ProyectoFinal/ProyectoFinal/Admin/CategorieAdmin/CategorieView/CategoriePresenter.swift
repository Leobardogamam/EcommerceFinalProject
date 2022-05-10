//
//  CategoriePresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation

class CategoriePresenter  {
    
    // MARK: Properties
    weak var view: CategorieViewProtocol?
    var interactor: CategorieInteractorInputProtocol?
    var wireFrame: CategorieWireFrameProtocol?
    
}

extension CategoriePresenter: CategoriePresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.loadActivity()
        interactor?.getCategories()
    }
    
    func showDetailCategorieView(with data: String) {
        wireFrame?.presentNewViewCategorieDetail(from: view!, withData: data)
    }
    
    func showAddCategorie() {
        wireFrame?.presentNewViewAddCategorie(from: view!)
    }
    
    func showProductView() {
        wireFrame?.presentNewViewProduct(from: view!)
    }
    
    func showUserView() {
        wireFrame?.presentNewViewUser(from: view!)
    }
    
    func showProfileUser() {
        wireFrame?.presentNewViewProfile(from: view!)
    }
    
   
    
}

extension CategoriePresenter: CategorieInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func interactorPushCategoriesPresenter(receivedData: [Categories]) {
        view?.stopAndHideActivity()
        view?.presenterGetCategoriesView(receivedData: receivedData)
    }
}
