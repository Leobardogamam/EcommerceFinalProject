//
//  DeleteEditCardsProtocols.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

protocol DeleteEditCardsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DeleteEditCardsPresenterProtocol? { get set }
}

protocol DeleteEditCardsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createDeleteEditCardsModule() -> UIViewController
}

protocol DeleteEditCardsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DeleteEditCardsViewProtocol? { get set }
    var interactor: DeleteEditCardsInteractorInputProtocol? { get set }
    var wireFrame: DeleteEditCardsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol DeleteEditCardsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol DeleteEditCardsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DeleteEditCardsInteractorOutputProtocol? { get set }
    var localDatamanager: DeleteEditCardsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DeleteEditCardsRemoteDataManagerInputProtocol? { get set }
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
}
