//
//  EditCardViewInteractor.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/12/22.
//  
//

import Foundation
import CoreData
import UIKit

class EditCardViewInteractor: EditCardViewInteractorInputProtocol {
    
    
   

    // MARK: Properties
    weak var presenter: EditCardViewInteractorOutputProtocol?
    var localDatamanager: EditCardViewLocalDataManagerInputProtocol?
    var remoteDatamanager: EditCardViewRemoteDataManagerInputProtocol?
    
    func getCard(numSerie: String) {
        localDatamanager?.localGetCard(numSerie: numSerie)
    }
    
    func saveCard(cvv: Int, day: Int, year: Int, idUser: Int, numSerie: String, name: String, color: UIColor, cardType: String) {
        localDatamanager?.localSaveCard(cvv: cvv, day: day, year: year, idUser: idUser, numSerie: numSerie, name: name, color: color, cardType: cardType)
    }
    

}

extension EditCardViewInteractor: EditCardViewRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension EditCardViewInteractor : EditCardViewLocalDataManagerOutputProtocol{
   
    func localDataManagerCallBackCards(card: [NSManagedObject]) {
        presenter?.interactorPushCards(card: card)
    }
    
    func localDataManagerCallBackCardEdited(edited: Bool) {
        presenter?.interactorPushCardEdited(edited: edited)
    }
    
    
}
