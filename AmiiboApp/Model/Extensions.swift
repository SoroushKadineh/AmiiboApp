//
//  Extensions.swift
//  AmiiboApp
//
//  Created by Soroush Kadineh on 8/16/18.
//  Copyright © 2018 Soroush Kadineh. All rights reserved.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
