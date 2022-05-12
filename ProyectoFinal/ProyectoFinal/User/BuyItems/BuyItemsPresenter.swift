//
//  BuyItemsPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class BuyItemsPresenter:BuyItemsPresenterProtocol {
    
    
    // MARK: Properties
    weak var view: BuyItemsViewProtocol?
    var interactor: BuyItemsInteractorInputProtocol?
    var wireFrame: BuyItemsWireFrameProtocol?
    var precio: Int?
    // TODO: implement presenter methods
    
    func viewDidLoad() {
        view?.sendPrice(price: precio ?? 0)
    }
    
    func showAddCards() {
        wireFrame?.showAddCards(from: view!)
    }
    
    func getAllShopingCar() {
        interactor?.getAllShopingCar()
    }
    
}

//extension BuyItemsPresenter: BuyItemsPresenterProtocol {
//    // TODO: implement presenter methods
//    func viewDidLoad() {
//    }
//
//    func showAddCards() {
//        wireFrame?.showAddCards(from: view!)
//    }
//
//}

extension BuyItemsPresenter: BuyItemsInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
