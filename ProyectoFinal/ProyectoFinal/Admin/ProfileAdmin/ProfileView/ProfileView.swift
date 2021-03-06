//
//  ProfileView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/8/22.
//  
//

import Foundation
import UIKit

class ProfileView: UIViewController, MyViewDelegateAdmin {
   
    

    // MARK: Properties
    var presenter: ProfilePresenterProtocol?
    @IBOutlet weak var TabBar: TabBarNavigationButtonsAdmin!
    @IBOutlet weak var selectedLabel: UILabel!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissViewControllers()
        selectedLabel.layer.cornerRadius = (selectedLabel.frame.size.width) / 2
        selectedLabel.clipsToBounds = true
        TabBar.btnProducts.tintColor = .black
        TabBar.btnCategories.tintColor = .black
        TabBar.btnUsers.tintColor = .black
        TabBar.btnProfile.tintColor = .systemIndigo
        TabBar.btnProfile.setImage(UIImage(systemName: "person.fill"), for: .normal)
        TabBar.delegate = self
    }
    
    func didTapButton(number: Int) {
        switch number{
            case 0:
                presenter?.showProductView()
            case 1:
                presenter?.showCategorieView()
            case 2:
                presenter?.showUserView()
            case 3:
                print("Here")
            default:
                print("Error")
        }
    }
    
    func dismissViewControllers() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func signOut(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alerta", message: "Estas seguro que deseas cerrar sesion?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Si", style: .default){UIAlertAction in
            self.dismissViewControllers()
        }
        
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel)

        alert.addAction(cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
        
       
    }
    
    @IBAction func seeProfilePressed(_ sender: UIButton) {
        presenter?.showProfileDetailView()
    }
    
}

extension ProfileView: ProfileViewProtocol {
  
    // TODO: implement view output methods
}
