//
//  EditCardViewProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/12/22.
//  
//

import Foundation
import UIKit
import CoreData

protocol EditCardViewViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: EditCardViewPresenterProtocol? { get set }
    func presenterPushCard(card : [NSManagedObject])
    func presenterPushCardEdited(edited : Bool)
}

protocol EditCardViewWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createEditCardViewModule(data : String) -> UIViewController
}

protocol EditCardViewPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: EditCardViewViewProtocol? { get set }
    var interactor: EditCardViewInteractorInputProtocol? { get set }
    var wireFrame: EditCardViewWireFrameProtocol? { get set }
    var numSerie : String? { get set }
    
    func viewDidLoad()
    func saveCard(cvv : Int, day : Int, year : Int, idUser : Int, numSerie : String, name : String, color : UIColor, cardType : String )
    
}

protocol EditCardViewInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushCards(card : [NSManagedObject])
    func interactorPushCardEdited(edited: Bool)
}

protocol EditCardViewInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: EditCardViewInteractorOutputProtocol? { get set }
    var localDatamanager: EditCardViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: EditCardViewRemoteDataManagerInputProtocol? { get set }
    
    func getCard(numSerie : String)
    func saveCard(cvv : Int, day : Int, year : Int, idUser : Int, numSerie : String, name : String, color : UIColor, cardType : String )
}

protocol EditCardViewDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol EditCardViewRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: EditCardViewRemoteDataManagerOutputProtocol? { get set }
}

protocol EditCardViewRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol EditCardViewLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: EditCardViewLocalDataManagerOutputProtocol? {get set}
    func localGetCard(numSerie : String)
   
    func localSaveCard(cvv : Int, day : Int, year : Int, idUser : Int, numSerie : String, name : String, color : UIColor, cardType : String )
    
}

protocol EditCardViewLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
    func localDataManagerCallBackCards(card : [NSManagedObject])
    func localDataManagerCallBackCardEdited(edited : Bool)
}

