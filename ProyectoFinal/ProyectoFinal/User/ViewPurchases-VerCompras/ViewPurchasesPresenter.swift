//
//  ViewPurchasesPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class ViewPurchasesPresenter  {
    
    // MARK: Properties
    weak var view: ViewPurchasesViewProtocol?
    var interactor: ViewPurchasesInteractorInputProtocol?
    var wireFrame: ViewPurchasesWireFrameProtocol?
    
}

extension ViewPurchasesPresenter: ViewPurchasesPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getPurchases()
    }
}

extension ViewPurchasesPresenter: ViewPurchasesInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
