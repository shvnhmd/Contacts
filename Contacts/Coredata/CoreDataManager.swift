

import UIKit
import CoreData

class CoreDataManager{
    
    static let shared = CoreDataManager()
        
    init(){}
    
    
    //MARK: INSERT DATA
    
    class func insertData(name:String, number:String ){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
     
        
     let obj =    NSEntityDescription.insertNewObject(forEntityName: "Contacts", into: context) as! Contacts
       
        obj.number = number
        obj.name = name
        

        do {
            try context.save()
            print("Saved in core data")
        } catch {
            print("Failed saving")
        }
    }
    
    
    //MARK: UPDATE DATA
    
    
    class func updateData(name : String, number: String ,newName : String, newNumber: String){
        
        
        var listArray = [Contacts]()
        
        let request : NSFetchRequest <Contacts>  = Contacts.fetchRequest()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        request.predicate = NSPredicate(format: "name = %@", name)
        
        do{
            listArray = try context.fetch(request)
            
            for data in listArray{
                
                data.name = newName
                data.number = newNumber
                
            }
            do {
                
                try context.save()
            } catch {
                print("Failed saving")
            }
        }
        catch{
            print("Error loading data \(error)")
        }
        
    }
    
    
    
    
    //MARK: DELETE DATA
    
    
    
    class func deleteData(withIndex index:Int){
        
        
        let list = CoreDataManager.fetchData()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        context.delete(list[index])
                
        do {
            try context.save()
            print("Saved --------")
        } catch {
            print("Failed saving")
        }
        
        
       
    }
    
    
    
    //MARK: FETCH DATA
    
    
    class func fetchData() -> [Contacts]{
        
        var listArray = [Contacts]()
        
        let request : NSFetchRequest <Contacts>  = Contacts.fetchRequest()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        

        let context = appDelegate.persistentContainer.viewContext
                do{
                    listArray = try context.fetch(request)
                    return listArray
                }
                catch{
                    print("Error loading data \(error)")
                }
       
        return listArray

    }
    
    
    
    
//    class func searchedData(name : String ) -> [Contacts] {
//
//        let listArray = [Contacts]()
//
//        let request : NSFetchRequest <Contacts>  = Contacts.fetchRequest()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//
//        let context = appDelegate.persistentContainer.viewContext
//
//        let predi = NSPredicate(format: "Contacts_name contains %@" , name)
//
//
//
//        request.predicate = predi
//
//
//
//
//        return listArray
//    }
//
    
    
}


