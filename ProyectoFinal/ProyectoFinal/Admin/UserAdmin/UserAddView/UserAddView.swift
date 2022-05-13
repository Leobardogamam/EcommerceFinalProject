//
//  UserAddView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/9/22.
//  
//

import Foundation
import UIKit

class UserAddView: UIViewController {

    // MARK: Properties
    var presenter: UserAddPresenterProtocol?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    var image : UIImage?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tap:)))
        userImageView.layer.borderWidth = 1.0
        userImageView.layer.masksToBounds = false
        userImageView.layer.borderColor = UIColor.black.cgColor
        userImageView.layer.cornerRadius = (userImageView.frame.size.width) / 2
        userImageView.clipsToBounds = true
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(tapGestureRecognizer)
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
    
    
    @IBAction func savePressed(_ sender: Any) {
        if passwordTextField.text != confirmTextField.text{
            let alert = UIAlertController(title: "Error", message: "Las contraseñas no coinciden", preferredStyle: .alert)


            let action = UIAlertAction(title: "Ok", style: .default)

            alert.addAction(action)
            self.present(alert, animated: true)
            
        } else{
            if nameTextField.text!.isEmpty || userImageView.image == nil || passwordTextField.text!.isEmpty || emailTextField.text!.isEmpty || confirmTextField.text!.isEmpty{
          
                let alert = UIAlertController(title: "Error", message: "Los campos estan vacios", preferredStyle: .alert)


                let action = UIAlertAction(title: "Ok", style: .default)

                alert.addAction(action)
                self.present(alert, animated: true)
        } else{
            presenter?.checkUser(email: emailTextField.text!)
        }
    }
  
  }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension UserAddView: UserAddViewProtocol {
   

    // TODO: implement view output methods
    
    func presenterPushCheckUser(userExist: Bool) {
        if userExist{
            DispatchQueue.main.async { [self] in
                presenter?.addImage(avatarImage: userImageView.image!)
            }
           
        }
        else{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Error", message: "El usuario ya existe", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)

                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
    }
    
    func presenterPushImageAdded(imageAdded: String) {
        
        DispatchQueue.main.async { [self] in
            presenter?.addUser(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, avatar: imageAdded)
        }
        
    }
    
    func presenterPushUserAdded(added: Bool) {
        if added{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Exitoso", message: "El usuario se añadio correctamente", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default){UIAlertAction in
                    self.presenter?.showUserView()
                }

                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
        else{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Error", message: "El usuario no se pudo añadir", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)

                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
    }
    
    
    
}

extension UserAddView : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true)
        
        image = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        userImageView.image = image

    }
}

