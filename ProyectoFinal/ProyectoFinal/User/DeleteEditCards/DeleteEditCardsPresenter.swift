//
//  DeleteEditCardsPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData

class DeleteEditCardsPresenter: DeleteEditCardsPresenterProtocol {
    
    
    // MARK: Properties
    weak var view: DeleteEditCardsViewProtocol?
    var interactor: DeleteEditCardsInteractorInputProtocol?
    var wireFrame: DeleteEditCardsWireFrameProtocol?
    var numSerie: String?

    
    func viewDidLoad() {
        interactor?.getCard(numSerie: numSerie!)
    }
    
    func showEditCardView(numSerie: String) {
        wireFrame?.presentNewEditCards(from: view!, data: numSerie)
    }
    
        
}



extension DeleteEditCardsPresenter: DeleteEditCardsInteractorOutputProtocol {
   
    // TODO: implement interactor output methods
    
    func interactorPushCards(card: [NSManagedObject]) {
        view?.presenterPushCard(card: card)
    }
    
}
