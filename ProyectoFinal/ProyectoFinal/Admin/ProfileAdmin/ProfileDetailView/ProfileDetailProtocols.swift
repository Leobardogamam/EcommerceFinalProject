//
//  ProfileDetailProtocols.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

protocol ProfileDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ProfileDetailPresenterProtocol? { get set }
}

protocol ProfileDetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createProfileDetailModule() -> UIViewController
}

protocol ProfileDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ProfileDetailViewProtocol? { get set }
    var interactor: ProfileDetailInteractorInputProtocol? { get set }
    var wireFrame: ProfileDetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func getUsers()
}

protocol ProfileDetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol ProfileDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ProfileDetailInteractorOutputProtocol? { get set }
    var localDatamanager: ProfileDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ProfileDetailRemoteDataManagerInputProtocol? { get set }
}

protocol ProfileDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ProfileDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ProfileDetailRemoteDataManagerOutputProtocol? { get set }
    func externalGetUsers()
}

protocol ProfileDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remotePushUsers(users : [Users])
}

protocol ProfileDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
