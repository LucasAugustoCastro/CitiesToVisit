//
//  ViewController.swift
//  CitiesToVisit
//
//  Created by Lucas Castro on 24/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var countriesTableView: UITableView!
    var countries: [String] = ["Germany", "France", "China", "Brazil", "Australia", "India", "Canada", "USA", "Mexico", "Ghana"]
    
    var continentCountry: [String: String] = [
        "Germany": "Europe",
        "France":"Europe",
        "China": "Asia",
        "Brazil": "South America",
        "Australia": "Australia",
        "India": "Asia",
        "Canada": "North America",
        "USA":"North America",
        "Mexico": "North America",
        "Ghana": "Africa"
    ]
    struct Constants {
        static let cellIdentifier = "CitiesToVisit"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)

    }
    
    


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var contentConfiguration = tableViewCell.defaultContentConfiguration()
        let city = countries[indexPath.row]
        contentConfiguration.text = city
        contentConfiguration.secondaryText = continentCountry[city] ?? ""
        tableViewCell.contentConfiguration = contentConfiguration
        
        return tableViewCell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped on cell at \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
