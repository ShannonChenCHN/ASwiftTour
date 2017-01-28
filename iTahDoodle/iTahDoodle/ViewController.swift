//
//  ViewController.swift
//  iTahDoodle
//
//  Created by ShannonChen on 2017/1/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    let todoList = TodoList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = todoList
        tableView.delegate = todoList
        todoList.registerCell(for: tableView)
        
        itemTextField.delegate = self
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        addButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        addButton.isEnabled = !textField.text!.isEmpty
    }
    
    // MARK: Button Action
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("Add to-do item: \(itemTextField.text!)")
        
        guard let todo = itemTextField.text else {
            return
        }
        todoList.add(todo)
        
        tableView.reloadData()
        
        itemTextField.text = nil
    }

}

