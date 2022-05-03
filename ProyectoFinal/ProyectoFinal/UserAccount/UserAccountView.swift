//
//  UserAccountView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class UserAccountView: UIViewController, MyViewDelegate {

    // MARK: Properties
    var presenter: UserAccountPresenterProtocol?

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
            self.present(ShopingCarWireFrame.createShopingCarModule(),animated:true)
        case 2:
            print("Ya estas Aqui")
            
        default:
            print("Error")
        }
    }
}

extension UserAccountView: UserAccountViewProtocol {
    // TODO: implement view output methods
}
