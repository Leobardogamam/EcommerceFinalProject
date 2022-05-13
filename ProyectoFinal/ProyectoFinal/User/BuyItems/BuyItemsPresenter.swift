//
//  BuyItemsPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData

class BuyItemsPresenter:BuyItemsPresenterProtocol {
    // MARK: Properties
    weak var view: BuyItemsViewProtocol?
    var interactor: BuyItemsInteractorInputProtocol?
    var wireFrame: BuyItemsWireFrameProtocol?
    var precio: Int?
    // TODO: implement presenter methods
    
    func viewDidLoad() {
        view?.sendPrice(price: precio ?? 0)
        getAllCardByPerson()
    }
    
    func showAddCards() {
        wireFrame?.showAddCards(from: view!)
    }
    
    func getAllShopingCar() {
        interactor?.getAllShopingCar()
    }
    
    func getAllCardByPerson() {
        interactor?.getAllCardByPerson()
    }
    
    
    
}
extension BuyItemsPresenter: BuyItemsInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func presenterPushCards(cards: [NSManagedObject]) {
        view?.presenterPushCards(cards: cards)
    }
    
}
