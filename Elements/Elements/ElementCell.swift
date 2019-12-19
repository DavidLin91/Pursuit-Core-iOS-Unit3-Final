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
        print(element.number)
        let elementInt = String(element.number)
        var newElementInt = ""
        print(elementInt)
        if elementInt.count == 1 {
            print("count: \(elementInt)")
            newElementInt += "00" + "\(elementInt)"
            print("newElementInt: \(newElementInt)")
        } else if elementInt.count == 2 {
            newElementInt += "0" + "\(elementInt)"
            print("doubledigitelementint \(newElementInt)")
        } else {
            newElementInt += "\(elementInt)"
        }

        elementNameLabel.text = element.name
        elementSymbolWeightLabel.text = "\(element.symbol)(\(element.number)) \(element.atomic_mass?.description ?? "N/A")"
        
        elementImage.getImage(with: "http://www.theodoregray.com/periodictable/Tiles/\(newElementInt)/s7.JPG") { (result) in
            switch result {
            case .failure(let appError):
                print("app error: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.elementImage.image = image
                }
            }
        }
    }
}
