//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by ShannonChen on 2017/1/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        
        imageView.image = ImageFactory.generateDefaultImage(of: imageView.frame.size)
    }
    
    // MARK: Navigation
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        
    }
    
}
