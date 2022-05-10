//
//  CategorieDetailView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieDetailView: UIViewController {

    var presenter: CategorieDetailPresenterProtocol?
    @IBOutlet weak var categorieImageView: UIImageView!
    @IBOutlet weak var categorieIdLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var categorieNameLabel: UILabel!
    
    var categorie : Categories?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
      
        backButton.layer.cornerRadius = (backButton.frame.size.width) / 2

        presenter?.viewDidLoad()
    }
    
    @IBAction func editPressed(_ sender: Any) {
        presenter?.showEditCategorieView(with: String((categorie?.id)!))
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension CategorieDetailView: CategorieDetailViewProtocol {
   
    // TODO: implement view output methods
    
    func presenterGetCategories(receivedCategorie: Categories) {
        categorie = receivedCategorie
        
        DispatchQueue.main.async { [self] in
            categorieImageView.image = UIImage(named: "No_Image_Available")
            categorieIdLabel.text = "\(String(describing: categorie!.id!))"
            categorieNameLabel.text = categorie?.name
        }
        
           if categorie?.image != nil {
                let urlImage = URL(string: (categorie?.image!) ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930")
                guard let urlImage = urlImage else { return }
                guard let data = try? Data(contentsOf: urlImage) else {return}
                
                DispatchQueue.main.async {
                    self.categorieImageView.image = UIImage(data: data)
                   
                }
        
        }
    }
    
}
