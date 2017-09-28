//
//  HomeTableViewController.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/27/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    struct Storyboard {
        static let reuseIdentifier = "FoundersTableCell"
        static let viewProfileSegue = "ViewProfileSegue"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return DirectoryData.sharedInstance.founders.count
        return 20
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.reuseIdentifier, for: indexPath as IndexPath) as! FoundersTableViewCell
        let founder = DirectoryData.sharedInstance.foundersData[indexPath.row % 4]
        cell.profileImage.image = founder?.founderPicture
        cell.profileImage.layer.masksToBounds = false
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height/2
        cell.profileImage.clipsToBounds = true
        cell.name.text = founder?.fullName
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.viewProfileSegue {
            let page = segue.destination as! ProfileViewController
            let cell = sender as! FoundersTableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let id = (indexPath?.row)! % 4
            page.founderId = id
            
        }
        
    }

}
