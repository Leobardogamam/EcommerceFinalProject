//
//  SignupView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 4/27/22.
//
//

import Foundation
import UIKit

class SignupView: UIViewController {

    // MARK: Properties
    var presenter: SignupPresenterProtocol?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var image : UIImage!
   
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.cornerRadius = (avatarImageView.frame.size.width) / 2
        avatarImageView.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tap:)))
            avatarImageView.isUserInteractionEnabled = true
            avatarImageView.addGestureRecognizer(tapGestureRecognizer)
           avatarImageView.image = UIImage(named: "addImage")
        
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
    
    @IBAction func signUpPressed(_ sender: Any) {
        if passTextField.text != confirmPass.text{
            let alert = UIAlertController(title: "Error", message: "Las contraseñas no coinciden", preferredStyle: .alert)


            let action = UIAlertAction(title: "Ok", style: .default)

            alert.addAction(action)
            self.present(alert, animated: true)
        }
        else{
            
            if emailTextField.text!.isEmpty || nameTextField.text!.isEmpty || passTextField.text!.isEmpty{
                showAlert()
            }else{
            
            if avatarImageView.image == UIImage(named: "addImage"){
                let alert = UIAlertController(title: "Aviso", message: "No ha añadido imagen, esta seguro que desea continuar?", preferredStyle: .alert)


                let action = UIAlertAction(title: "Si", style: .default){ [self] UIAlertAction in
                    
                    if emailTextField.text!.isEmpty || nameTextField.text!.isEmpty || passTextField.text!.isEmpty{
                        showAlert()
                    }
                    else{
                        presenter?.email = emailTextField.text
                        presenter?.name = nameTextField.text
                        presenter?.password = passTextField.text
                        presenter?.avatarImage = image
                        presenter?.viewDidLoad()
                    
                    }
                }
                   
                
                let cancel = UIAlertAction(title: "Cancel", style: .cancel)

                alert.addAction(cancel)
                alert.addAction(action)
                self.present(alert, animated: true)
            }

            
        }
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Hay campos vacios", preferredStyle: .alert)


        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
        
    }
    
   
    @IBAction func onPressDissmis(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension SignupView: SignupViewProtocol {
   
    // TODO: implement view output methods
    
    func alertUserNotAvailable() {
        let alert = UIAlertController(title: "Error", message: "El usuario ya esta registrado", preferredStyle: .alert)

        let action = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

extension SignupView : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true)
        
        image = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        avatarImageView.image = image

    }
}
