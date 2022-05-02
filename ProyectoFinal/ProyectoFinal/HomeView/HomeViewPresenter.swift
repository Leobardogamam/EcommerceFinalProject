//
//  HomeViewPresenter.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class HomeViewPresenter  {
    
    // MARK: Properties
    weak var view: HomeViewViewProtocol?
    var interactor: HomeViewInteractorInputProtocol?
    var wireFrame: HomeViewWireFrameProtocol?
    
}

extension HomeViewPresenter: HomeViewPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getCategoriesData()
//        jmendez@develop.com.mx señor juan mendez mi nombre __ egresado de tal universidad___ titulado en tanto tiempo, soy recomendado de alumnos de semillero y me interessa entrar a los semilleros para la tecnologia tal: adjunto mi cv gracias por su tiempo
        
    }
    func showSpecifcCategory(id: Int, name:String) {
        wireFrame?.showSpecificCategory(from: view!, id: id, name: name)
    }
}

extension HomeViewPresenter: HomeViewInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func pushData(with data: [Categories]) {
        view?.pushData(with: data)
    }
    
}
