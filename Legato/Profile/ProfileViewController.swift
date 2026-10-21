//
//  ProfileViewController.swift
//  Legato
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    let sectionTitles = ["Recently Viewed", "My Ratings", "Listening Parties"]
    let sectionRows = [["Album Name - Artist Name", "Song Title - Artist Name", "Album Name - Artist Name"], ["Album Name - ★★★★☆", "Song Title - ★★★☆☆", "Song Title - ★★★★★"], ["Late Night Mix", "Study Session"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        if let userID = Auth.auth().currentUser?.displayName {
            usernameLabel.text = "@\(userID)"
        }
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
