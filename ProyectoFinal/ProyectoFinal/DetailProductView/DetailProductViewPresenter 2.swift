//
//  DetailProductViewPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class DetailProductViewPresenter  {
    
    // MARK: Properties
    weak var view: DetailProductViewViewProtocol?
    var interactor: DetailProductViewInteractorInputProtocol?
    var wireFrame: DetailProductViewWireFrameProtocol?
    
}

extension DetailProductViewPresenter: DetailProductViewPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension DetailProductViewPresenter: DetailProductViewInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
