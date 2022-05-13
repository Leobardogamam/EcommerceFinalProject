//
//  EditCardViewView.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/12/22.
//  
//

import Foundation
import UIKit
import CoreData

class EditCardViewView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDragDelegate, UIDropInteractionDelegate, UIDragInteractionDelegate {
    
    

    // MARK: Properties
    var presenter: EditCardViewPresenterProtocol?
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var collectionPickerView: UIPickerView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    var cards : [NSManagedObject]?
    var cardsType = [String]()
    var colors = [UIColor]()
    var cardTypeSelected : String?
    var selectedColor : UIColor?
    var userDefault = UserDefaults()
    

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.colors += [.black, .systemBlue, .systemIndigo, .systemMint, .systemGray, .lightGray, .systemGray5, .gray, .white, .systemRed, .systemYellow]
        
        self.cardsType += ["Visa", "Mastercard", "American Express"]
        
        self.colorCollectionView.dragDelegate = self
        self.cardImageView.isUserInteractionEnabled = true
        let dropInteraction = UIDropInteraction(delegate: self)
        self.cardImageView.addInteraction(dropInteraction)
        let dragInteraction = UIDragInteraction(delegate: self)
        self.cardImageView.addInteraction(dragInteraction)
    
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        
        if cvvTextField.text!.isEmpty || dayTextField.text!.isEmpty || yearTextField.text!.isEmpty || numTextField.text!.isEmpty || nameTextField.text!.isEmpty{
        
        let alert = UIAlertController(title: "Error", message: "Hay campos vacios", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
        }else{
    
        if let savedPerson = userDefault.object(forKey: "UserLogged") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Users.self, from: savedPerson) {
                presenter?.saveCard(cvv: Int(cvvTextField.text!)!, day: Int(dayTextField.text!)!, year: Int(yearTextField.text!)!, idUser: loadedPerson.id, numSerie: numTextField.text!, name: nameTextField.text!, color: selectedColor!, cardType: cardTypeSelected!)
            }
    }
}
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

extension EditCardViewView: EditCardViewViewProtocol {
    
  
    // TODO: implement view output methods
    
    func presenterPushCard(card: [NSManagedObject]) {
        self.cards = card
        
        DispatchQueue.main.async {
            let cards = self.cards![0]
            self.cardImageView.backgroundColor = cards.value(forKey: "color") as? UIColor
            self.numTextField.text = cards.value(forKey: "numserie") as? String
            self.nameTextField.text = cards.value(forKey: "name") as? String
            self.dayTextField.text = "\(String(describing: (cards.value(forKey: "day") as? Int)!))"
            self.yearTextField.text = "\(String(describing: (cards.value(forKey: "year") as? Int)!))"
            self.cvvTextField.text = "\(String(describing: (cards.value(forKey: "cvv") as? Int)!))"
            self.cardTypeSelected = cards.value(forKey: "cardType") as? String
            self.selectedColor = cards.value(forKey: "color") as? UIColor
            
            self.collectionPickerView.reloadAllComponents()
            
            if cards.value(forKey: "cardType") as? String == "Visa"{
                self.collectionPickerView.selectRow(0, inComponent: 0, animated: true)
            } else if cards.value(forKey: "cardType") as? String == "Mastercard"{
                self.collectionPickerView.selectRow(1, inComponent: 0, animated: true)
            } else if cards.value(forKey: "cardType") as? String == "American Express"{
                self.collectionPickerView.selectRow(2, inComponent: 0, animated: true)
            }
            
            
        }
    }
    
    func presenterPushCardEdited(edited: Bool) {
        if edited{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Exitoso", message: "La tarjeta se actualizo correctamente", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
                    self.dismiss(animated: true)
                }
                alert.addAction(action)
                present(alert, animated: true)
            }
        }else{
            DispatchQueue.main.async { [self] in
                let alert = UIAlertController(title: "Error", message: "La tarjeta no se actualizo", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default)
                
                alert.addAction(action)
                present(alert, animated: true)
            }
    }
    
}
    
}

extension EditCardViewView : UIPickerViewDelegate, UIPickerViewDataSource{
    
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
