//
//  ProfileViewController.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/21/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit
import MessageUI

class ProfileViewController: UIViewController, MFMailComposeViewControllerDelegate {


    struct Storyboard {
        static let spouseSegueIdentifier = "SpouseSegueIdentifier"
        static let editProfileIdentifier = "EditProfileSegue"
        static let doneSegueIdentifier = "DoneSegueIdentifier"
    }
    var founderId: Int?
    var founder: Founder?
    
    // MARK :- Outlets
    @IBOutlet weak var callButtonOutlet: UIButton!
    @IBOutlet weak var emailButtonOutlet: UIButton!    
    @IBOutlet weak var spouseStackView: UIStackView!
    @IBOutlet weak var founderImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var businessProfile: UILabel!
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        founderImage.layer.masksToBounds = false
        founderImage.layer.cornerRadius = founderImage.frame.height/2
        founderImage.clipsToBounds = true
        loadFounderData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK :- Actions

    @IBAction func callButtonAction(_ sender: Any) {
        if let number = URL(string: (founder?.phone?.replacingOccurrences(of: "-", with: ""))!) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        }
    }

    @IBAction func emailButtonAction(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        sendEmail()
    }
    
    func sendEmail() {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        if let email = founder?.email {
            composeVC.setToRecipients([email])
            composeVC.setSubject("Hello!")
            composeVC.setMessageBody("Hello this is my message body!", isHTML: false)
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
    private func loadFounderData() {
        founder = DirectoryData.sharedInstance.foundersData[founderId!]
        name.text = founder?.fullName
        founderImage.image = founder?.founderPicture
        bio.text = founder?.bio
        year.text = founder?.year
        status.text = founder?.status
        if (founder?.spouse == nil)
        {
            spouseStackView.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.spouseSegueIdentifier {
            if let spouseId = founder?.getSpouseId() {
                let page = segue.destination as! ProfileViewController
                page.founderId = spouseId
            }
        }
        if (segue.identifier == Storyboard.editProfileIdentifier) {
            let page = segue.destination as! EditProfileTableViewController
            page.founderId = founderId
        }
        
    }
    
    @IBAction func unwindToViewProfile(segue: UIStoryboardSegue)
    {
        loadFounderData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
