//
//  ViewPurchasesView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ViewPurchasesView: UIViewController {

    // MARK: Properties
    var presenter: ViewPurchasesPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewPurchasesView: ViewPurchasesViewProtocol {
    // TODO: implement view output methods
}
