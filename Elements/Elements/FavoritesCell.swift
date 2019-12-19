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
        favoriteElementName.text = element.name
        favoriteElementLabel.text = "\(element.symbol)(\(element.number)) \(element.atomic_mass?.description ?? "N/A")"
    }
    

}
