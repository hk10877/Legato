//
//  ProfileViewController.swift
//  Legato
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    // Row items for each activity section
    let sectionTitles = ["Recently Viewed", "My Ratings", "Listening Parties"]
    let sectionRows = [["Album Name - Artist Name", "Song Title - Artist Name", "Album Name - Artist Name"], ["Album Name - ★★★★☆", "Song Title - ★★★☆☆", "Song Title - ★★★★★"], ["Late Night Mix", "Study Session"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Display userID from firebase auth
        if let userID = Auth.auth().currentUser?.displayName {
            usernameLabel.text = "@\(userID)"
        }
    }
    
    // Returns the total number of sections in the profile table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    // Returns the header title string for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    // Returns the number of rows belonging to a given section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionRows[section].count
    }
    
    // Dequeues and configures a reuseable cell to display the activity item 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = sectionRows[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
}
