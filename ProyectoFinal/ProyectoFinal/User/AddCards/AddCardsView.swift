//
//  AddCardsView.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 27/04/22.
//  
//

import Foundation
import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class AddCardsView: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDragDelegate, UIDropInteractionDelegate, UIDragInteractionDelegate  {
  
    
   
    

    // MARK: Properties
    var presenter: AddCardsPresenterProtocol?
    var colors = [UIColor]()
    var cardsType = [String]()
    var cardTypeSelected : String = "Visa"
    var selectedColor : UIColor = .gray
    var userDefaults = UserDefaults()
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var numCardTextField: UITextField!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var nameCardTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var cardPickerView: UIPickerView!
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colors += [.black, .systemBlue, .systemIndigo, .systemMint, .systemGray, .lightGray, .systemGray5, .gray, .white, .systemRed, .systemYellow]
        self.cardsType += ["Visa", "Mastercard", "American Express"]
        
        self.colorCollectionView.dragDelegate = self
        self.cardImageView.isUserInteractionEnabled = true
        let dropInteraction = UIDropInteraction(delegate: self)
        self.cardImageView.addInteraction(dropInteraction)
        let dragInteraction = UIDragInteraction(delegate: self)
        self.cardImageView.addInteraction(dragInteraction)
        self.cardImageView.backgroundColor = .gray
    }
    
    @IBAction func addCardPressed(_ sender: Any) {
        
        if cvvTextField.text!.isEmpty || dayTextField.text!.isEmpty || yearTextField.text!.isEmpty || numCardTextField.text!.isEmpty || nameCardTextField.text!.isEmpty{
            
            let alert = UIAlertController(title: "Error", message: "Hay campos vacios", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
        else{
        
            presenter?.saveCard(cvv: Int(cvvTextField.text!)!, day: Int(dayTextField.text!)!, year: Int(yearTextField.text!)!, idUser: userDefaults.integer(forKey: "IdUsuario") , numSerie: Int(numCardTextField.text!)!, name: nameCardTextField.text!, color: selectedColor, cardType: cardTypeSelected)
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colors.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
        
        let color = self.colors[indexPath.row]
        cell.backgroundColor = color
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let color = self.colors[indexPath.row]
        let itemProvider = NSItemProvider(object: color)
        let item = UIDragItem(itemProvider: itemProvider)
        return [item]
    }
    
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        guard let image = self.cardImageView.image else {return []}
        let provider = NSItemProvider(object: image)
        let item = UIDragItem(itemProvider: provider)
        return [item]
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        
        session.loadObjects(ofClass: UIColor.self) { items in
            guard let color = items.first as? UIColor else {return}
            
           
            self.cardImageView.backgroundColor = color
            self.selectedColor = color
            
    }
 }

}

extension AddCardsView: AddCardsViewProtocol {
   
    
    // TODO: implement view output methods
    
    func presenterPushCardAdded(added: Bool) {
        if added{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Exitoso", message: "La tarjeta se añadio correctamente", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
                    self.presenter?.showCardView()
                }
                alert.addAction(action)
                present(alert, animated: true)
            }
        }else{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Error", message: "La tarjeta no se añadio", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default)
                
                alert.addAction(action)
                present(alert, animated: true)
            }
     }
  }
}

extension AddCardsView : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()

        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 25)

        // where data is an Array of String
        let cardType = cardsType[row]
        label.text = cardType
        return label
      }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cardsType.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cardType = cardsType[row]
         return cardType
     
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        let cardType = cardsType[row]
        cardTypeSelected = cardType
    }
}
