//
//  ShopingCarPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ShopingCarPresenter  {
    
    // MARK: Properties
    weak var view: ShopingCarViewProtocol?
    var interactor: ShopingCarInteractorInputProtocol?
    var wireFrame: ShopingCarWireFrameProtocol?
    
}

extension ShopingCarPresenter: ShopingCarPresenterProtocol {
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        getAllCarCoredataSave()
    }
    
    func getAllCarCoredataSave() {
        interactor?.getAllCarCoredataSave()
    }
}

extension ShopingCarPresenter: ShopingCarInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func getApiDescodificados(product:[Product], precioTotal:Int) {
        view?.getDatosDescodificados(product: product)
    }
}
