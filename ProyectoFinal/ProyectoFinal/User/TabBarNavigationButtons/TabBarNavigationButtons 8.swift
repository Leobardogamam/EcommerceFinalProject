//
//  TabBarNavigationButtons.swift
//  ProyectoFinal
//
//  Created by Leobardo Gama on 01/05/22.
//

import UIKit

class TabBarNavigationButtons: UIView {

    
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnUserAccount: UIButton!
    @IBOutlet weak var btnCart: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit(){
        let xibView = Bundle.main.loadNibNamed("TabBarNavigationButtons", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
    
}
