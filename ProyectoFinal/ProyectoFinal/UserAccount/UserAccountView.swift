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
    var userDefault = UserDefaults()

    @IBOutlet weak var imgCircle: UIView!
    @IBOutlet weak var tabBar: TabBarNavigationButtons!
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
        tabBar.btnUserAccount.tintColor = .blue
        tabBar.btnUserAccount.layer.cornerRadius = tabBar.btnUserAccount.frame.height / 2
        tabBar.btnUserAccount.backgroundColor = .systemGray3
        imgCircle.layer.cornerRadius = imgCircle.frame.height / 2
    }
    
//    MARK: Navegacion De Opciones De usuario
    @IBAction func onPressActions(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            presenter?.showViewProfile()
        case 1:
            presenter?.showViewPurchases()
        case 2:
            presenter?.showMyCards()
        case 3:
            userDefault.set(0, forKey: "IdUsuario")
            self.view.window?.rootViewController?.dismiss(animated: true)
            dismiss(animated: true)
        default:
            print("Error")
        }
    }
    
//    MARK: Navegacion TabBar
    func didTapButton(number: Int) {
        switch number{
        case 0:
            presenter?.showHomeView()
        case 1:
            presenter?.showShopingCart()
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
