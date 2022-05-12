//
//  MyCardsPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class MyCardsPresenter  {
    
    // MARK: Properties
    weak var view: MyCardsViewProtocol?
    var interactor: MyCardsInteractorInputProtocol?
    var wireFrame: MyCardsWireFrameProtocol?
    
}

extension MyCardsPresenter: MyCardsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getCards()
    }
    
    func showAddCards() {
        wireFrame?.showAddCards(from: self.view!)
    }
    
}

extension MyCardsPresenter: MyCardsInteractorOutputProtocol {

    
    // TODO: implement interactor output methods
    
    func interactorPushCards(cards: [NSManagedObject]) {
        view?.presenterPushCards(cards: cards)
    }
}
