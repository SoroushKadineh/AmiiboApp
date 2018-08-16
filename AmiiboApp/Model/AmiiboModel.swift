//
//  AmiiboModel.swift
//  AmiiboApp
//
//  Created by Soroush Kadineh on 8/15/18.
//  Copyright © 2018 Soroush Kadineh. All rights reserved.
//

import Foundation

struct AmiiboModel: Codable {
    let amiibo: [AmiiboDetailModel]
}

struct AmiiboDetailModel: Codable {
    let amiiboSeries, character, gameSeries, head, image, name, tail, type: String
    let release: releas
}

struct releas: Codable {
    let au, eu, jp, na : String?
}

