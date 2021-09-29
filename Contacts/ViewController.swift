//
//  ViewController.swift
//  Contacts
//
//  Created by Ikhtiar Ahmed on 11/22/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    //MARK: IBOutlet
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var addButtonPressed: UIBarButtonItem!
    
    
    
    //MARK: Variables
    
    
    
    
    //var itemArray = [Contacts]()
    
    
    var  itemArray = CoreDataManager.fetchData()
    
    //collectionView.reloadData()
    
    //MARK: ViewDidLoad
    
    
    
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
    }
    
    
    
    
    //MARK:Tableview Methods
    
    
    
    
    
    
    
    
    
    //MARK:Tableview Datasource Methods
    
    
    // Tells the data source to return the number of rows in a given section of a table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    
    
    // Asks the data source for a cell to insert in a particular location of the table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.idetifier, for: indexPath) as! TableViewCell
        let contact = itemArray[indexPath.row]// as! Contacts
        cell.label1.text = contact.name
        cell.label2.text = contact.number
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    
    
    
    
    
    
    //MARK: Tableview Delegate Methods
    
    
    
    // Tells the delegate a row is selected (select a row on table)
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           let oldName = itemArray[indexPath.row].name!
           let oldNumber = itemArray[indexPath.row].number!
         
           var newName : String = ""
           var newNumber : String = ""
           
           
           
           let alert = UIAlertController(title: "Edit", message: "", preferredStyle:  .alert)
       

           let action = UIAlertAction(title: "Save", style: .default){ [self](action) in
               
               newName = alert.textFields![0].text!
               newNumber = alert.textFields![1].text!

               
               CoreDataManager.updateData(name: oldName, number: oldNumber, newName: newName, newNumber: newNumber)
              
               self.itemArray = CoreDataManager.fetchData()
               
              self.tableView.reloadData()
               
           }
           
           alert.addTextField { (alertTextField) in
               alertTextField.placeholder = "Enter a name"
               
               alertTextField.text = oldName
           }
           
           alert.addTextField { (alertTextField) in
               alertTextField.placeholder = "Enter a number"
               
               alertTextField.text = oldNumber
           }
           
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           alert.addAction(action)
           self.present(alert, animated: true, completion: nil)

       }

    
    
    
    //MARK: CREATE: Bar Item Button
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // Variable declaration
        var name : String = ""
        var number : String = ""
        
       // let defaults = UserDefaults.standard
        
        
        
        let alert = UIAlertController(title: "Add New Contact", message: "", preferredStyle:  .alert)
        

        let action = UIAlertAction(title: "Save", style: .default){ [self](action) in
            
            name = alert.textFields![0].text!
            number = alert.textFields![1].text!

            
            
            CoreDataManager.insertData(name: name, number: number)
           
            self.itemArray = CoreDataManager.fetchData()
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter a name"
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter a number"
            
        }
        
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)

    }
    
    
    
    
    // MARK: DELETE: Swipe
    
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        CoreDataManager.deleteData(withIndex: indexPath.row)
        itemArray.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
   
    
    
    
    
    // MARK: UPDATE: Long Press Gesture
    
    
        
    
}
