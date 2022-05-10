//
//  ShopingCarPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class ShopingCarPresenter  {
    
    // MARK: Properties
    weak var view: ShopingCarViewProtocol?
    var interactor: ShopingCarInteractorInputProtocol?
    var wireFrame: ShopingCarWireFrameProtocol?
    
}

extension ShopingCarPresenter: ShopingCarPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension ShopingCarPresenter: ShopingCarInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
