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
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneAction(_ sender: Any) {
        
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
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
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func openGallery()
    {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }

    private func loadData()
    {
        firstNameOutlet.text = founder?.firstName
        lastNameOutlet.text = founder?.lastName
        // Company name
        phoneNumberOutlet.text = founder?.phone
        emailOutlet.text = founder?.email
        spouseFullNameOutlet.text = founder?.spouse
        bioOutlet.text = founder?.bio
        imageOutlet.layer.masksToBounds = false
        imageOutlet.layer.cornerRadius = imageOutlet.frame.height/2
        imageOutlet.clipsToBounds = true
        imageOutlet.image = founder?.founderPicture
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ProfileViewController.Storyboard.doneSegueIdentifier {
            let newFounder = DirectoryData.sharedInstance.foundersData[founderId!]
            newFounder?.firstName = firstNameOutlet.text
            newFounder?.lastName = lastNameOutlet.text
            newFounder?.fullName = (newFounder?.firstName)! + " " + (newFounder?.lastName)!
            newFounder?.phone = phoneNumberOutlet.text
            newFounder?.email = emailOutlet.text
            newFounder?.spouse = spouseFullNameOutlet.text
            newFounder?.bio = bioOutlet.text
            newFounder?.founderPicture = imageOutlet.image
            DirectoryData.sharedInstance.foundersData[founderId!] = founder
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
