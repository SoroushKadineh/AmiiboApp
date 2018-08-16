//
//  AmiiboDetailScreen.swift
//  AmiiboApp
//
//  Created by Soroush Kadineh on 8/15/18.
//  Copyright © 2018 Soroush Kadineh. All rights reserved.
//

import UIKit

class AmiiboDetailScreen: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var chosenAmiibo: AmiiboDetailModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDetails()
    }
    
    func displayDetails () {
        nameLabel.text          = "Name: " + chosenAmiibo.name
        seriesLabel.text        = "Series: " + chosenAmiibo.amiiboSeries
        releaseDateLabel.text   = "NA Release Date: " + (chosenAmiibo.release.na ?? "Unknown")
    }
}
