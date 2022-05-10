//
//  AddCardsPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class AddCardsPresenter  {
    
    // MARK: Properties
    weak var view: AddCardsViewProtocol?
    var interactor: AddCardsInteractorInputProtocol?
    var wireFrame: AddCardsWireFrameProtocol?
    
}

extension AddCardsPresenter: AddCardsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension AddCardsPresenter: AddCardsInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
