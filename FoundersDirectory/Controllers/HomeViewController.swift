//
//  HomeViewController.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/21/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    // MARK: - Properties
    fileprivate let reuseIdentifier = "FoundersCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var founders: [Founder] = [Founder(firstName: "Chewbacca", lastName: "Wookiee", fullName: "Chewie Wookiee", preferredName: "Chewie", phone: "801-555-1212", email: "chewie@gmail.com", bio: "Chewbacca, nicknamed \"Chewie\", is a fictional character in the Star Wars franchise. He is a Wookiee, a tall, hirsute biped and intelligent species from the planet Kashyyyk. Chewbacca is the loyal friend and associate of Han Solo, and serves as co-pilot on Solo's ship, the Millenium Falcon.", status: "Gold", year: 1984, address: "125 Sailing Along Now", image: UIImage(named: "founder1")!),
           Founder(firstName: "Leia", lastName: "Princess", fullName: "Leia Organa", preferredName: "Your Highness", phone: "385-555-1212", email: "leia@gmail.com", bio: nil, status: "Platinum", year: 1984, address: nil, image: UIImage(named: "founder2")!),
           Founder(firstName: "Han", lastName: "Solo", fullName: "Han Solo", preferredName: "Han", phone: "214-555-1212", email: "han@gmail.com", bio: nil, status: "Silver", year: 1984, address: nil, image: UIImage(named: "founder3")!),
           Founder(firstName: "Luke", lastName: "Skywalker", fullName: "Luke Skywalker", preferredName: "Luke", phone: "408-555-1212", email: "luke@gmail.com", bio: nil, status: "Bronze", year: 1984, address: nil, image: UIImage(named: "founder4")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFounders()
    }
    
    private func loadFounders() {
    
        for _ in 1...20 {
            founders.append(founders[Int(arc4random_uniform(4))])
        }
       
    }
    

    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.founders.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! FoundersViewCell

        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.foundersCellImage.image = founders[indexPath.row].founderPicture
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(founders[indexPath.row].preferredName)!")
    }
}
