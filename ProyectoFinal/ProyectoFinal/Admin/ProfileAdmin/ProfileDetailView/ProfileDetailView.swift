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
    @IBOutlet weak var emailLabel: UILabel!
    var userDefault = UserDefaults()
    
    
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
        
        if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                roleProfileLabel.text = loadedPerson.role.capitalized
                nameProfileLabel.text = loadedPerson.name.capitalized
                emailLabel.text = loadedPerson.email
                profileimageview.image = UIImage(named: "loading")
                DispatchQueue.global(qos: .default).async {
                        let url = URL(string: loadedPerson.avatar)
                        guard let url = url else {return}
                        let data = try? Data(contentsOf: url)
                        DispatchQueue.main.async {
                            guard let data = data else {return}
                            self.profileimageview.image = UIImage(data: data)
                        }
                    }
                   
                }
            }
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
   

    
    
}

extension ProfileDetailView: ProfileDetailViewProtocol {
    // TODO: implement view output methods
}
