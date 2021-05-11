//
//  ViewController.swift
//  shoppingListApp
//
//  Created by Dalton Flanagan on 4/5/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var shoppingTableView: UITableView!
    
    @IBOutlet weak var newItemTextField: UITextField!
    
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shoppingTableView.delegate = self
        shoppingTableView.dataSource = self
        
        let item1 = Item(name: "Soy milk")
        let item2 = Item(name: "Cereal")
        
        items = [item1, item2]
        
        loadData()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        return cell
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        if let newItemName = newItemTextField.text {
            
            let newItem = Item(name: newItemName)
            newItemTextField.text = ""
            items.append(newItem)
            shoppingTableView.reloadData()
            
            saveData()
            
        }
        
        
    }
    
    func loadData() {
        
        if let objects = UserDefaults.standard.value(forKey: "Items") as? Data {
            
            if let objectsDecoded = try? JSONDecoder().decode(Array.self, from: objects) as [Item] {
                
                items = objectsDecoded
            }
        }
    }
    
    func saveData() {
        
        if let encoded = try? JSONEncoder().encode(items) {

            UserDefaults.standard.set(encoded, forKey: "Items")
        }
        
    }
    
}

