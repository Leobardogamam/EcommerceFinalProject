//
//  AddCardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol AddCardsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: AddCardsPresenterProtocol? { get set }
    func presenterPushCardAdded(added : Bool)
}

protocol AddCardsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createAddCardsModule() -> UIViewController
    func presentNewViewCards(from view : AddCardsViewProtocol)
}

protocol AddCardsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: AddCardsViewProtocol? { get set }
    var interactor: AddCardsInteractorInputProtocol? { get set }
    var wireFrame: AddCardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func saveCard(cvv : Int, day : Int, year : Int, idUser : Int, numSerie : String, name : String, color : UIColor, cardType : String )
    func showCardView()
}

protocol AddCardsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCardAdded(added : Bool)
}

protocol AddCardsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: AddCardsInteractorOutputProtocol? { get set }
    var localDatamanager: AddCardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: AddCardsRemoteDataManagerInputProtocol? { get set }
    
    func saveCard(cvv : Int, day : Int, year : Int, idUser : Int, numSerie : String, name : String, color : UIColor, cardType : String )
}

protocol AddCardsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol AddCardsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: AddCardsRemoteDataManagerOutputProtocol? { get set }
    
}

protocol AddCardsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol AddCardsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: AddCardsLocalDataManagerOutputProtocol? {get set}
    
    func localSaveCard(cvv : Int, day : Int, year : Int, idUser : Int, numSerie : String, name : String, color : UIColor, cardType : String )
    
}


protocol AddCardsLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
    func localDataManagerCallBackCardAdded(added : Bool)
    
}
