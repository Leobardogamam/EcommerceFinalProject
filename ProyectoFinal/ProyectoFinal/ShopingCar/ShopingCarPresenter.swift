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
    
    
    func eliminate(id: Int, price:Int) {
        interactor?.eliminate(id: id, price: price)
    }
}

extension ShopingCarPresenter: ShopingCarInteractorOutputProtocol {
    
    
    // TODO: implement interactor output methods
    func getApiDescodificados(product:[Product], precioTotal:Int) {
        view?.getDatosDescodificados(product: product, precioTotal:precioTotal)
    }
    func resetPrice(price: Int) {
        view?.resetPrice(price: price)
    }
}
