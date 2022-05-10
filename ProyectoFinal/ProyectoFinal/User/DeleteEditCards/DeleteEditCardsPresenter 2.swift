//
//  DeleteEditCardsPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class DeleteEditCardsPresenter  {
    
    // MARK: Properties
    weak var view: DeleteEditCardsViewProtocol?
    var interactor: DeleteEditCardsInteractorInputProtocol?
    var wireFrame: DeleteEditCardsWireFrameProtocol?
    
}

extension DeleteEditCardsPresenter: DeleteEditCardsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension DeleteEditCardsPresenter: DeleteEditCardsInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
