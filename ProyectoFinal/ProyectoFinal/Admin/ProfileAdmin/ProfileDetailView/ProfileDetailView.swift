//
//  ProfileDetailView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

class ProfileDetailView: UIViewController {

    // MARK: Properties
    var presenter: ProfileDetailPresenterProtocol?
    @IBOutlet weak var profileimageview: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var nameProfileLabel: UILabel!
    @IBOutlet weak var roleProfileLabel: UILabel!
    @IBOutlet weak var emailProfileLabel: UILabel!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = view1.frame.height / 2
        view2.layer.cornerRadius = view2.frame.height / 2
        view3.layer.cornerRadius = view3.frame.height / 2
        view4.layer.cornerRadius = view4.frame.height / 2
        view5.layer.cornerRadius = view5.frame.height / 2
        profileimageview.layer.cornerRadius = profileimageview.frame.height / 2
        presenter?.viewDidLoad()
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
   

    
    
}

extension ProfileDetailView: ProfileDetailViewProtocol {
    // TODO: implement view output methods
}
