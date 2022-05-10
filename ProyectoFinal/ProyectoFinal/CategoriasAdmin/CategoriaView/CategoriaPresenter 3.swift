//
//  CategoriaPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/2/22.
//  
//

import Foundation

class CategoriaPresenter  {
    
    // MARK: Properties
    weak var view: CategoriaViewProtocol?
    var interactor: CategoriaInteractorInputProtocol?
    var wireFrame: CategoriaWireFrameProtocol?
    
}

extension CategoriaPresenter: CategoriaPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension CategoriaPresenter: CategoriaInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
