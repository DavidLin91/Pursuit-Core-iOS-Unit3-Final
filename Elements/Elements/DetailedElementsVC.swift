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
    }
    
}
