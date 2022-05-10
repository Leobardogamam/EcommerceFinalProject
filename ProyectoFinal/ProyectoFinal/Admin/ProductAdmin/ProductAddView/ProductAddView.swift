//
//  ProductAddView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//  
//

import Foundation
import UIKit

class ProductAddView: UIViewController{

    // MARK: Properties
    var presenter: ProductAddPresenterProtocol?
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    var categories : [Categories]?
    var categorieSelected = 1
    var image : UIImage?
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        productImageView.layer.borderWidth = 1.0
        productImageView.layer.masksToBounds = false
        productImageView.layer.borderColor = UIColor.black.cgColor
        productImageView.layer.cornerRadius = (productImageView.frame.size.width) / 2
        productImageView.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tap:)))
        productImageView.isUserInteractionEnabled = true
        productImageView.addGestureRecognizer(tapGestureRecognizer)
        presenter?.viewDidLoad()
        
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
    
    
    @IBAction func addPressed(_ sender: Any) {
        presenter?.addImage(productImage: productImageView.image!)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension ProductAddView: ProductAddViewProtocol {
    // TODO: implement view output methods
    
    func presenterPushCategoriesView(receivedData: [Categories]) {
        categories = receivedData
        
        
        DispatchQueue.main.async {
            self.categoryPickerView.reloadAllComponents()
 
        }
    }
    
    func presenterPushImageAdded(location: String) {
        
        DispatchQueue.main.async { [self] in
            presenter?.addProduct(title: titleTextField.text!, price: Int(priceTextField.text!)!, description: descriptionTextView.text, categoryId: categorieSelected, image: location)
        }
       
    }
    
    func presenterPushProductAdded(added : Bool) {
        
        if added{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Exitoso", message: "El producto se añadio correctamente", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
                    self.presenter?.showProductView()
                }
                alert.addAction(action)
                present(alert, animated: true)
            }
        }else{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Error", message: "El producto no se añadio", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default)
                
                alert.addAction(action)
                present(alert, animated: true)
            }
        }
       
    }
}

extension ProductAddView : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true)
        
        image = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        productImageView.image = image

    }
}

extension ProductAddView : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()

        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 25)

        // where data is an Array of String
        let categoriesName = categories?[row].name ?? ""
        label.text = categoriesName
        return label
      }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let categoriesName = categories?[row].name ?? ""
         return categoriesName
     
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        let categoriesId = categories?[row].id ?? 1
        categorieSelected = categoriesId
    }
}

