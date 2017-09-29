//
//  ProfileViewController.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/21/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit
import MessageUI

class ProfileViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {


    struct Storyboard {
        static let spouseSegueIdentifier = "SpouseSegueIdentifier"
        static let editProfileIdentifier = "EditProfileSegue"
        static let doneSegueIdentifier = "DoneSegueIdentifier"
    }
    let mailNotAvailable = "Mail services are not available"
    var founderId: Int?
    var founder: Founder?
    
    // MARK :- Outlets
    @IBOutlet weak var callButtonOutlet: UIButton!
    @IBOutlet weak var emailButtonOutlet: UIButton!    
    @IBOutlet weak var spouseStackView: UIStackView!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var callStackView: UIStackView!
    @IBOutlet weak var textStackView: UIStackView!
    @IBOutlet weak var founderImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var companyName: UILabel!
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
//        if let number = URL(string: (founder?.phone?.replacingOccurrences(of: "-", with: ""))!) {
//            UIApplication.shared.open(number, options: [:], completionHandler: nil)
//        }
        if let url = URL(string: "tel://\((founder?.phone?.replacingOccurrences(of: "-", with: ""))!)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    @IBAction func emailButtonAction(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {
            print(mailNotAvailable)
            return
        }
        sendEmail()
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
             if let email = founder?.email {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([email])
                present(mail, animated: true)
            }
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @IBAction func textButtonAction(_ sender: Any) {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.recipients = [(founder?.phone?.replacingOccurrences(of: "-", with: ""))!]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func loadFounderData() {
        founder = DirectoryData.sharedInstance.foundersData[founderId!]
        name.text = founder?.fullName
        companyName.text = founder?.companyName
        founderImage.image = founder?.founderPicture
        bio.text = founder?.bio
        year.text = founder?.year
        status.text = founder?.status
        spouseStackView.isHidden = (founder?.spouse == nil || !(founder?.spouseListed)!) ? true : false
        callStackView.isHidden = (!(founder?.phoneListed)!) ? true : false
        textStackView.isHidden = (!(founder?.phoneListed)!) ? true : false
        emailStackView.isHidden = (!(founder?.emailListed)!) ? true : false
        

    }
    
    // MARK: - Navigation
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
    
    // Coming back from Edit View, we update the profile
    @IBAction func unwindToViewProfile(segue: UIStoryboardSegue)
    {
        loadFounderData()
    }

}
