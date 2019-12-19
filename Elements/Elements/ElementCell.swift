//
//  ElementCell.swift
//  Elements
//
//  Created by David Lin on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {

    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementNameLabel: UILabel!
    @IBOutlet weak var elementSymbolWeightLabel: UILabel!
    
    func configureCell(element: AllElements) {
        elementNameLabel.text = element.name
        elementSymbolWeightLabel.text = "\(element.symbol)(\(element.number)) \(element.atomic_mass?.description ?? "N/A")"
        
//        elementImage.getImage(with: element., completion: <#T##(Result<UIImage, AppError>) -> ()#>)
//
    }
    
    
}
