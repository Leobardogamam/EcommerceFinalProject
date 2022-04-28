//
//  HomeViewView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class HomeViewView: UIViewController {

    // MARK: Properties
    var presenter: HomeViewPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewView: HomeViewViewProtocol {
    // TODO: implement view output methods
}
