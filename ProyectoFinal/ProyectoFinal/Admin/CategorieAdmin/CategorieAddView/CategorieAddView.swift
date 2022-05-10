//
//  CategorieAddView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class CategorieAddView: UIViewController {

    // MARK: Properties
    var presenter: CategorieAddPresenterProtocol?
    @IBOutlet weak var categorieImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var image : UIImage?
    

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tap:)))
        categorieImageView.isUserInteractionEnabled = true
        categorieImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tap: UITapGestureRecognizer)
       {
           if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
               
               let imagePicker : UIImagePickerController = UIImagePickerController()
               imagePicker.delegate = self
               imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
               imagePicker.allowsEditing = true
   //          imagePicker.mediaTypes = [UTType.jpeg.identifier]
               self.present(imagePicker, animated: true)
               
           }
       }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if !nameTextField.text!.isEmpty && categorieImageView.image != nil{
            presenter?.addImage(productImage: categorieImageView.image!)
        }
    }
    
}

extension CategorieAddView : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true)
        
        image = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        categorieImageView.image = image

    }
}

extension CategorieAddView: CategorieAddViewProtocol {
   
    // TODO: implement view output methods
    
    func presenterPushImageAdded(location: String) {
        DispatchQueue.main.async { [self] in
            presenter?.addCategorie(name: nameTextField.text!, image: location)
        }
       
    }
    
    func presenterPushCategorieAdded(added : Bool) {
        
        if added{
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Exitoso", message: "La categoria se añadio correctamente", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in

                    self.presenter?.showCategorieView()
                }

                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
        else{
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: "Ocurrio un error al añadir", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default)

                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
    }
    
}
