//
//  DetailProductViewView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class DetailProductViewView: UIViewController {

    // MARK: Properties
    var presenter: DetailProductViewPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailProductViewView: DetailProductViewViewProtocol {
    // TODO: implement view output methods
}
