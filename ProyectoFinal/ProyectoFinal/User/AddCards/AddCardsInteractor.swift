//
//  AddCardsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class AddCardsInteractor: AddCardsInteractorInputProtocol {
   
    

    // MARK: Properties
    weak var presenter: AddCardsInteractorOutputProtocol?
    var localDatamanager: AddCardsLocalDataManagerInputProtocol?
    var remoteDatamanager: AddCardsRemoteDataManagerInputProtocol?

    func saveCard(cvv: Int, day: Int, year: Int, idUser: Int, numSerie: Int, name: String, color: UIColor, cardType: String) {
        localDatamanager?.localSaveCard(cvv: cvv, day: day, year: year, idUser: idUser, numSerie: numSerie, name: name, color: color, cardType: cardType)
    }
}

extension AddCardsInteractor : AddCardsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension AddCardsInteractor : AddCardsLocalDataManagerOutputProtocol{
    func localDataManagerCallBackCardAdded(added: Bool) {
        presenter?.interactorPushCardAdded(added: added)
    }
    
    
}
