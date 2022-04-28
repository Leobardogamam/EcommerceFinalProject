//
//  CardsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class CardsView: UIViewController {

    // MARK: Properties
    var presenter: CardsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CardsView: CardsViewProtocol {
    // TODO: implement view output methods
}
