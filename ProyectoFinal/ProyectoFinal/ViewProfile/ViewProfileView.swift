//
//  ViewProfileView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit

class ViewProfileView: UIViewController {

    // MARK: Properties
    var presenter: ViewProfilePresenterProtocol?
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.cornerRadius = view1.frame.height / 2
        view2.layer.cornerRadius = view2.frame.height / 2
        view3.layer.cornerRadius = view3.frame.height / 2
        view4.layer.cornerRadius = view4.frame.height / 2
        view5.layer.cornerRadius = view5.frame.height / 2
        imgUser.layer.cornerRadius = imgUser.frame.height / 2
    }
}

extension ViewProfileView: ViewProfileViewProtocol {
    // TODO: implement view output methods
}
