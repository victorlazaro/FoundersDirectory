//
//  EditProfileTableViewController.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/27/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    var founder: Founder?
    var founderId: Int?
    let imagePicker = UIImagePickerController()
    
    // String constants
    let chooseImage = "Choose Image"
    let camera = "Camera"
    let gallery = "Gallery"
    let cancel = "Cancel"
    let warning = "Warning"
    let noCameraMessage = "You do not have a camera"
    let ok = "OK"
    
    // MARK: - Outlets
    @IBOutlet weak var firstNameOutlet: UITextField!
    @IBOutlet weak var lastNameOutlet: UITextField!
    @IBOutlet weak var companyNameOutlet: UITextField!
    @IBOutlet weak var phoneNumberOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var spouseFullNameOutlet: UITextField!
    @IBOutlet weak var bioOutlet: UITextView!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        founder = DirectoryData.sharedInstance.foundersData[founderId!]
        imagePicker.delegate = self
        loadData()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageOutlet.isUserInteractionEnabled = true
        imageOutlet.addGestureRecognizer(tapGestureRecognizer)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func loadData()
    {
        firstNameOutlet.text = founder?.firstName
        lastNameOutlet.text = founder?.lastName
        companyNameOutlet.text = founder?.companyName
        phoneNumberOutlet.text = founder?.phone
        emailOutlet.text = founder?.email
        spouseFullNameOutlet.text = founder?.spouse
        bioOutlet.text = founder?.bio
        imageOutlet.layer.masksToBounds = false
        imageOutlet.layer.cornerRadius = imageOutlet.frame.height/2
        imageOutlet.clipsToBounds = true
        imageOutlet.image = founder?.founderPicture
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        let alert = UIAlertController(title: chooseImage, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: camera, style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: gallery, style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: cancel, style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(.camera))
        {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: warning, message: noCameraMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: ok, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func openGallery()
    {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // Updates the model as the cell is selected, toggling the checkmark
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            switch indexPath.row {
            case 1:
                cell.accessoryType = (founder?.phoneListed)! ? .none : .checkmark
                founder?.phoneListed = !(founder?.phoneListed)!
            case 2:
                cell.accessoryType = (founder?.emailListed)! ? .none : .checkmark
                founder?.emailListed = !(founder?.emailListed)!
            case 3:
                cell.accessoryType = (founder?.spouseListed)! ? .none : .checkmark
                founder?.spouseListed = !(founder?.spouseListed)!
            default:
                return
            }
        }
    }
    
    // Initializes the checkmark based upon the model
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        switch indexPath.row {
        case 1:
            cell.accessoryType = (founder?.phoneListed)! ? .checkmark : .none
            return cell
        case 2:
            cell.accessoryType = (founder?.emailListed)! ? .checkmark : .none
            return cell
        case 3:
            cell.accessoryType = (founder?.spouseListed)! ? .checkmark : .none
            return cell
        default:
            return cell
        }
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageOutlet.contentMode = .scaleAspectFit
            imageOutlet.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    // Updates the model based upon changes made
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ProfileViewController.Storyboard.doneSegueIdentifier {
            let newFounder = DirectoryData.sharedInstance.foundersData[founderId!]
            newFounder?.firstName = firstNameOutlet.text
            newFounder?.lastName = lastNameOutlet.text
            newFounder?.fullName = (newFounder?.firstName)! + " " + (newFounder?.lastName)!
            newFounder?.companyName = companyNameOutlet.text
            newFounder?.phone = phoneNumberOutlet.text
            newFounder?.email = emailOutlet.text
            newFounder?.spouse = spouseFullNameOutlet.text
            newFounder?.bio = bioOutlet.text
            newFounder?.founderPicture = imageOutlet.image
            DirectoryData.sharedInstance.foundersData[founderId!] = founder
        }
    }
    
    

}
