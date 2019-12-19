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
    
    
}
