//
//  EditCardViewPresenter.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/12/22.
//  
//

import Foundation
import CoreData
import UIKit

class EditCardViewPresenter: EditCardViewPresenterProtocol  {
  
    
    
    
    
    // MARK: Properties
    weak var view: EditCardViewViewProtocol?
    var interactor: EditCardViewInteractorInputProtocol?
    var wireFrame: EditCardViewWireFrameProtocol?
    
    var numSerie: String?
    
    func viewDidLoad() {
        interactor?.getCard(numSerie: numSerie!)
    }
    
    func saveCard(cvv: Int, day: Int, year: Int, idUser: Int, numSerie: String, name: String, color: UIColor, cardType: String) {
        interactor?.saveCard(cvv: cvv, day: day, year: year, idUser: idUser, numSerie: numSerie, name: name, color: color, cardType: cardType)
    }
}



extension EditCardViewPresenter: EditCardViewInteractorOutputProtocol {
  
    
    
    // TODO: implement interactor output methods
    
    func interactorPushCards(card: [NSManagedObject]) {
        view?.presenterPushCard(card: card)
    }
    
    func interactorPushCardEdited(edited: Bool) {
        view?.presenterPushCardEdited(edited: edited)
    }
}
