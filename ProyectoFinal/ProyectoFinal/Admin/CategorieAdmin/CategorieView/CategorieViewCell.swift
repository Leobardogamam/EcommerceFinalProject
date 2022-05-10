//
//  CategorieViewCell.swift
//  ProyectoFinal
//
//  Created by Alejandro Brito on 5/6/22.
//

import UIKit

class CategorieViewCell: UITableViewCell {

    @IBOutlet weak var categorieImageView: UIImageView!
    @IBOutlet weak var categorieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
