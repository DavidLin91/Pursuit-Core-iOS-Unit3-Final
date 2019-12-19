//
//  FavoritesCell.swift
//  Elements
//
//  Created by David Lin on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {
    @IBOutlet weak var favoriteElementImage: UIImageView!
    @IBOutlet weak var favoriteElementName: UILabel!
    @IBOutlet weak var favoriteElementLabel: UILabel!
    
    
    func configureCell (element: AllElements) {
        let elementInt = String(element.number)
               var newElementInt = ""
               if elementInt.count == 1 {
                   newElementInt += "00" + "\(elementInt)"
               } else if elementInt.count == 2 {
                   newElementInt += "0" + "\(elementInt)"
               } else {
                   newElementInt += "\(elementInt)"
               }
        favoriteElementName.text = element.name
        favoriteElementLabel.text = "\(element.symbol)(\(element.number)) \(element.atomic_mass?.description ?? "N/A")"
        
        favoriteElementImage.getImage(with: "http://www.theodoregray.com/periodictable/Tiles/\(newElementInt)/s7.JPG") { (result) in
            switch result {
            case .failure(let appError):
                print("app error: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.favoriteElementImage.image = image
                }
            }
        }
    }
}
