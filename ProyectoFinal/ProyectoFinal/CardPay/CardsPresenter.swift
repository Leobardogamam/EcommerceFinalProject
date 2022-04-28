//
//  CardsPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class CardsPresenter  {
    
    // MARK: Properties
    weak var view: CardsViewProtocol?
    var interactor: CardsInteractorInputProtocol?
    var wireFrame: CardsWireFrameProtocol?
    
}

extension CardsPresenter: CardsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension CardsPresenter: CardsInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
