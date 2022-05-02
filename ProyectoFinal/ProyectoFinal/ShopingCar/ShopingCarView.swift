//
//  ShopingCarView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ShopingCarView: UIViewController, MyViewDelegate {
    // MARK: Properties
    var presenter: ShopingCarPresenterProtocol?

    @IBOutlet weak var tabBar: TabBarNavigationButtons!
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
    }
    
    
    func didTapButton(number: Int) {
        switch number{
        case 0:
            self.present(HomeViewWireFrame.createHomeViewModule(),animated:true)
        case 1:
            print("Ya estas Aqui")
        case 2:
            self.present(UserAccountWireFrame.createUserAccountModule(),animated:true)
        default:
            print("Error")
        }
    }
}

extension ShopingCarView: ShopingCarViewProtocol {
    // TODO: implement view output methods
}
