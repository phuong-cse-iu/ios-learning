//
//  MainVC.swift
//  DreamLister
//
//  Created by TranTPhuong on 12/1/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    // NSFetchedResultsControllerDelegate support funcs to fetch 
    //  result efficient, not fetch all data into mem at one time
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        generateTestData()
        getData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
       configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
       
       return cell
    }
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath) {
        // update cell
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func getData() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        // sort fetched data
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        // this controller will help out fetch data from core data
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    // core data is about update, this method will listen to the change in database and handle that
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    // this will handle CRUD for core data
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case .update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                // update cell data
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    func generateTestData() {
        
        let item = Item(context: context)
        item.title = "New Macbook Pro"
        item.price = 1800
        item.details = "Can't wait until September event"
        
        let item2 = Item(context: context)
        item2.title = "New Macbook Pro"
        item2.price = 1800
        item2.details = "Can't wait until September event"
        
        let item3 = Item(context: context)
        item3.title = "New Macbook Pro"
        item3.price = 1800
        item3.details = "Can't wait until September event"
        
        let item4 = Item(context: context)
        item4.title = "New Macbook Pro"
        item4.price = 1800
        item4.details = "Can't wait until September event"
        
        let item5 = Item(context: context)
        item5.title = "New Macbook Pro"
        item5.price = 1800
        item5.details = "Can't wait until September event"
        
        let item6 = Item(context: context)
        item6.title = "New Macbook Pro"
        item6.price = 1800
        item6.details = "Can't wait until September event"
    }

}
    
    
    


