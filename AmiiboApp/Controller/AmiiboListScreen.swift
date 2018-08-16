//
//  AmiiboListScreen.swift
//  AmiiboApp
//
//  Created by Soroush Kadineh on 8/15/18.
//  Copyright © 2018 Soroush Kadineh. All rights reserved.
//

import UIKit

class AmiiboListScreen: UITableViewController {
    
    var amiiboList = [AmiiboDetailModel]()
    var chosenAmiibo : AmiiboDetailModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData () {
        guard let url = URL(string: amiiboAPI_URL) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (optionalData, optionalResponse, optionalError) in
            guard let strongRef = self else { return }
            guard optionalError == nil,
                  let response = optionalResponse as? HTTPURLResponse, response.statusCode == 200,
                  let data = optionalData, let extractedAmiiboList = try? JSONDecoder().decode(AmiiboModel.self, from: data) else { strongRef.displayError(); return }
            DispatchQueue.main.async {
                strongRef.amiiboList = extractedAmiiboList.amiibo
                strongRef.tableView.reloadData()
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amiiboList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let particularAmiibo = amiiboList[safe: indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: myCell, for: indexPath)
        cell.textLabel?.text        = particularAmiibo.name
        cell.detailTextLabel?.text  = particularAmiibo.amiiboSeries
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let particularAmiibo = amiiboList[safe: indexPath.row] else { return }
        chosenAmiibo = particularAmiibo
        performSegue(withIdentifier: showDetailScreen, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == showDetailScreen, let destinationVC = segue.destination as? AmiiboDetailScreen, chosenAmiibo != nil else { return }
        destinationVC.chosenAmiibo = chosenAmiibo!
    }
}

extension AmiiboListScreen {
    func displayError () {
        let alertController = UIAlertController(title: "Error", message: "Something went wrong, try again!", preferredStyle: .alert)
        let cancelAction    = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}












