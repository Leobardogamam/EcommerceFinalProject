//
//  ViewProfilePresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class ViewProfilePresenter  {
    
    // MARK: Properties
    weak var view: ViewProfileViewProtocol?
    var interactor: ViewProfileInteractorInputProtocol?
    var wireFrame: ViewProfileWireFrameProtocol?
    
}

extension ViewProfilePresenter: ViewProfilePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        
    }
    
}

extension ViewProfilePresenter: ViewProfileInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
