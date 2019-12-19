//
//  Element.swift
//  Elements
//
//  Created by David Lin on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct AllElements: Codable {
    let name: String
    let symbol: String
    let atomic_mass: Double
    let number: Int
    let density: Double?
    let melt: Double?
    let boil: Double?
    let discovered_by: String?
}
