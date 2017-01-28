//
//  TodoList.swift
//  iTahDoodle
//
//  Created by ShannonChen on 2017/1/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    static let CellIdentifier = "TodoListCell"
    
    // MARK: Properties
    private let fileURL: URL = {
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = documentDirectoryURL.appendingPathComponent("todolist.items")
        
        return url
    }()
    
    fileprivate var items: [String] = []
    
    override init() {
        super.init()
        
        loadItems()
    }
    
    func add(_ item: String) {
        
        items.append(item)
        
        saveItems()
    }
    
    func loadItems() {
        if let itemArray = NSArray.init(contentsOf: fileURL) as? [String] {
            items = itemArray
        }
    }
    
    func saveItems() {
        let itemArray = items as NSArray
        
        if !itemArray.write(to: fileURL, atomically: true) {
            print("Could not save to-do list")
        }
    }
    
    func deleteItem(at index: Int) {
        items.remove(at: index)
        
        saveItems()
    }
    
}

extension TodoList {
    func registerCell(for tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TodoList.CellIdentifier)
    }
}


// MARK: - UITableViewDataSource
extension TodoList: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoList.CellIdentifier, for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deleteItem(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .bottom)
    }
}


