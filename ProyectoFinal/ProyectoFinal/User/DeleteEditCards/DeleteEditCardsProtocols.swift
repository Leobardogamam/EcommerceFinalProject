//
//  DeleteEditCardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import CoreData

protocol DeleteEditCardsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DeleteEditCardsPresenterProtocol? { get set }
    func presenterPushCard(card : [NSManagedObject])
  
}

protocol DeleteEditCardsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createDeleteEditCardsModule(data : String) -> UIViewController
    func presentNewEditCards(from view : DeleteEditCardsViewProtocol, data : String)
}

protocol DeleteEditCardsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DeleteEditCardsViewProtocol? { get set }
    var interactor: DeleteEditCardsInteractorInputProtocol? { get set }
    var wireFrame: DeleteEditCardsWireFrameProtocol? { get set }
    var numSerie : String? { get set }
    
    func viewDidLoad()
    func showEditCardView(numSerie : String)
    func deleteCard(numSerie : String)
}

protocol DeleteEditCardsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCards(card : [NSManagedObject])
    
}

protocol DeleteEditCardsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DeleteEditCardsInteractorOutputProtocol? { get set }
    var localDatamanager: DeleteEditCardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DeleteEditCardsRemoteDataManagerInputProtocol? { get set }
    
    func getCard(numSerie : String)
    func deleteCard(numSerie : String)
}

protocol DeleteEditCardsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol DeleteEditCardsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DeleteEditCardsRemoteDataManagerOutputProtocol? { get set }
}

protocol DeleteEditCardsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DeleteEditCardsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: DeleteEditCardsLocalDataManagerOutputProtocol? {get set}
    func localGetCard(numSerie : String)
    func localDeleteCard(numSerie : String)
   
}

protocol DeleteEditCardsLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
    func localDataManagerCallBackCards(card : [NSManagedObject])
    
}
