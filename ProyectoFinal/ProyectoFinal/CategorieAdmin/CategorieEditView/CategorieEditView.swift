//
//  CategorieEditView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieEditView: UIViewController {

    // MARK: Properties
    var presenter: CategorieEditPresenterProtocol?

    @IBOutlet weak var categorieImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var categorie : Categories?
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if nameTextField.text!.isEmpty {
            
            let alert = UIAlertController(title: "Error", message: "Los campos estan vacios", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default)

            alert.addAction(action)
            present(alert, animated: true)
        }
        else{
            presenter?.presenterSaveEditCategorie(id: (categorie?.id)!, name: (nameTextField.text)!)
            
        }
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension CategorieEditView: CategorieEditViewProtocol {
  
    
    // TODO: implement view output methods
    
    func presenterGetCategorie(receivedCategorie: Categories) {
        categorie = receivedCategorie
        
        DispatchQueue.main.async { [self] in
            categorieImageView.image = UIImage(named: "No_Image_Available")
            nameTextField.text = categorie?.name
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
    
    func presenterShowAlert(edited: Bool) {
        
        if edited{
            
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Exitoso", message: "La categoria se actualizo correctamente", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
                    self.presenter?.showCategorieView()
                }

                alert.addAction(action)
                self.present(alert, animated: true)
            }
          
        }else{
            
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: "Ocurrio un error al actualizar", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default)

                alert.addAction(action)
                self.present(alert, animated: true)
            }
            
           
        }
    }
}
