//
//  DetailedElementsVCViewController.swift
//  Elements
//
//  Created by David Lin on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedElementsVC: UIViewController {

    var elementsDetail: AllElements?
    @IBOutlet weak var elementSymbol: UILabel!
    @IBOutlet weak var elementNumber: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementMass: UILabel!
    @IBOutlet weak var meltingPoint: UILabel!
    @IBOutlet weak var boilingPoint: UILabel!
    @IBOutlet weak var discoveredBy: UILabel!
    @IBOutlet weak var elementCellView: UIView!
    @IBOutlet weak var detailedView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    override func viewDidLayoutSubviews() {
        elementCellView.layer.cornerRadius = 10
        detailedView.layer.cornerRadius = 10
        favoriteButton.layer.cornerRadius = 10
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = elementsDetail?.name
        loadData()
    }
    
    
    func loadData() {
        elementSymbol.text = elementsDetail?.symbol
        elementNumber.text = elementsDetail?.number.description
        elementName.text = elementsDetail?.name
        elementMass.text = elementsDetail?.atomic_mass.description
        meltingPoint.text = "Melting Point: \(elementsDetail?.melt?.description ?? "N/A")"
        boilingPoint.text = "Boiling Point: \(elementsDetail?.boil?.description ?? "N/A")"
        discoveredBy.text = "Discovered By: \(elementsDetail?.discovered_by ?? "N/A")"
    }
    
    
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        guard let element = elementsDetail else {
            return
        }
        
        let favorite = AllElements(name: element.name, symbol: element.symbol, atomic_mass: element.atomic_mass, number: element.number, density: element.density, melt: element.melt, boil: element.boil, discovered_by: element.discovered_by, favoritedBy: "David")
        
        ElementsAPIClient.postFavorites(favorite: favorite) { (result) in
            DispatchQueue.main.async {
                sender.isEnabled = true
            }
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                self.showAlert(title: "Error posting favorite", message: "\(appError)")
                }
            case .success:
                DispatchQueue.main.async {
                    self.showAlert(title: "Success", message: "\(element.name) was favorited") { action in
                        self.dismiss(animated: true)
                    }
                }
            }
        }
    }
    
    
    
}
