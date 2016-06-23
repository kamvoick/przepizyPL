//
//  ViewController.swift
//  przepizy
//
//  Created by Kamil Wójcik on 06.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var przepisy = [Przepis]()
//    var fetchedResultsController: NSFetchedResultsController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchedRequest = NSFetchRequest(entityName: "Przepis")
        
        do{
            let results = try context.executeFetchRequest(fetchedRequest)
            self.przepisy = results as! [Przepis]
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("przepisCell") as? przepisCell{
            let przepis = przepisy[indexPath.row]
            cell.skonfigurujKomorke(przepis)
            return cell
        }else {
            return przepisCell()
        }
        
    }
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return przepisy.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
           
            
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            
            context.deleteObject(przepisy[indexPath.row])
            app.saveContext()
            
            przepisy.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    
}

