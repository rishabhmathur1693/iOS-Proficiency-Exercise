//
//  FactsModel.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 02/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Foundation

struct FactsModel: Codable {
    var title: String?
    var rows: [Row]?
}

struct Row: Codable {
    var title, rowDescription: String?
    var imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
