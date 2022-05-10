//
//  TabBarNavigationButtons.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/3/22.
//

import UIKit

protocol MyViewDelegateAdmin {
    func didTapButton(number:Int)
}


class TabBarNavigationButtonsAdmin: UIView {
    
    var delegate: MyViewDelegateAdmin?
    @IBOutlet weak var btnProducts: UIButton!
    @IBOutlet weak var btnCategories: UIButton!
    @IBOutlet weak var btnUsers: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    

    override init(frame: CGRect) {
            super.init(frame: frame)
            viewInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            viewInit()
        }
        
        func viewInit(){
            let xibView = Bundle.main.loadNibNamed("TabBarNavigationButtonsAdmin", owner: self, options: nil)![0] as! UIView
            xibView.frame = self.bounds
            addSubview(xibView)
        }
    
    @IBAction func navigationPressed(_ sender: UIButton) {
        switch sender.tag{
               case 0:
                   buttonTapAction(number: sender.tag)
               case 1:
                   buttonTapAction(number: sender.tag)
               case 2:
                   buttonTapAction(number: sender.tag)
               case 3:
                   buttonTapAction(number: sender.tag)
               default:
                   print("Error")
               }

    }
    
    func buttonTapAction(number:Int) {
              delegate?.didTapButton(number: number)
          }
    

}
