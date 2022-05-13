//
//  DeleteEditCardsInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import CoreData

class DeleteEditCardsInteractor: DeleteEditCardsInteractorInputProtocol {
    
    
   

    // MARK: Properties
    weak var presenter: DeleteEditCardsInteractorOutputProtocol?
    var localDatamanager: DeleteEditCardsLocalDataManagerInputProtocol?
    var remoteDatamanager: DeleteEditCardsRemoteDataManagerInputProtocol?
    
    func getCard(numSerie : String) {
        localDatamanager?.localGetCard(numSerie: numSerie)
    }
    

    func deleteCard(numSerie: String) {
        localDatamanager?.localDeleteCard(numSerie: numSerie)
    }
}

extension DeleteEditCardsInteractor: DeleteEditCardsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension DeleteEditCardsInteractor : DeleteEditCardsLocalDataManagerOutputProtocol{
    
    func localDataManagerCallBackCards(card: [NSManagedObject]) {
        presenter?.interactorPushCards(card: card)
    }
    
    
    
}
