//
//  ProfileViewController.swift
//  Legato
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let sectionTitles = ["Recently Viewed", "My Ratings", "Listening Parties"]
    let sectionRows = [["Album Name - Artist Name", "Song Title - Artist Name", "Album Name - Artist Name"], ["Album Name - ★★★★☆", "Song Title - ★★★☆☆", "Song Title - ★★★★★"], ["Late Night Mix", "Study Session"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionRows[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = sectionRows[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
}
