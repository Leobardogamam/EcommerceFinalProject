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
            self.navigationController?.pushViewController(HomeViewWireFrame.createHomeViewModule(), animated: true)
        case 1:
            
            self.navigationController?.pushViewController(ShopingCarWireFrame.createShopingCarModule(), animated: true)
        case 2:
            //self.navigationController?.popViewController(animated: true)
            self.navigationController?.pushViewController(UserAccountWireFrame.createUserAccountModule(), animated: true)
        default:
            print("Error")
        }
        
    }
}

extension ShopingCarView: ShopingCarViewProtocol {
    // TODO: implement view output methods
}
