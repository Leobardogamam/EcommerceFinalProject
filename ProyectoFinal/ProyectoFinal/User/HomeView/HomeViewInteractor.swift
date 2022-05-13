//
//  HomeViewInteractor.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation

class HomeViewInteractor: HomeViewInteractorInputProtocol {
   
    

    // MARK: Properties
    weak var presenter: HomeViewInteractorOutputProtocol?
    var localDatamanager: HomeViewLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeViewRemoteDataManagerInputProtocol?
    
    func getCategoriesData() {
        remoteDatamanager?.callCategoriesData()
    }
    
    func deleteCarWithoutUser() {
        localDatamanager?.localDeleteCartWithoutUser()
    }
    
    

}

extension HomeViewInteractor: HomeViewRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func getCategoriesData(with data: [Categories]) {
        presenter?.pushData(with: data)
    }
    
}

extension HomeViewInteractor : HomeViewLocalDataManagerOutputProtocol{
    
}
