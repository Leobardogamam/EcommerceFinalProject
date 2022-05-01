//
//  HomeViewPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class HomeViewPresenter  {
    
    // MARK: Properties
    weak var view: HomeViewViewProtocol?
    var interactor: HomeViewInteractorInputProtocol?
    var wireFrame: HomeViewWireFrameProtocol?
    
}

extension HomeViewPresenter: HomeViewPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getCategoriesData()
        
    }
}

extension HomeViewPresenter: HomeViewInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func pushData(with data: [Categories]) {
        view?.pushData(with: data)
    }
    
}
