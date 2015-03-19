//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Johanna Lichtman on 2/17/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    let itemStore: ItemStore
    let imageStore: ImageStore
    
    @IBOutlet var headerView: UIView!
    
    @IBAction func addNewItem(sender: AnyObject){
        let newItem = itemStore.createItem()
        
        let dvc = DetailViewController(item: newItem, itemStore: itemStore, imageStore: imageStore)
        dvc.isNew = true
        
        dvc.cancelClosure = {
            self.itemStore.removeItem(newItem)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        dvc.saveClosure = {
            if let index = find(self.itemStore.allItems, newItem){
                let indexPath = NSIndexPath(forRow: index, inSection: 0)
                self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
            }
        self.dismissViewControllerAnimated(true, completion: nil)

        }
        
        let nc = UINavigationController(rootViewController: dvc)
        nc.modalPresentationStyle = UIModalPresentationStyle.FormSheet
        
        presentViewController(nc, animated: true, completion: nil)
    }
    
    init(itemStore: ItemStore, imageStore: ImageStore){
        
        self.itemStore = itemStore
        self.imageStore = imageStore

        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Homepwner"
        
        // create a new bar button that will send addNewItem(_:) to ItemsViewController
        let addItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewItem:")
        
        navigationItem.rightBarButtonItem = addItem
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .Default, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as ItemCell
        let item = itemStore.allItems[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: { (action)-> Void in
                self.itemStore.removeItem(item)
                self.imageStore.deleteImageForKey(item.itemKey)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
            
            ac.addAction(deleteAction)
            ac.addAction(cancelAction)
            ac.modalPresentationStyle = .Popover
            
            if let cell = tableView.cellForRowAtIndexPath(indexPath){
                ac.popoverPresentationController?.sourceView = cell
                ac.popoverPresentationController?.sourceRect = cell.bounds
            }
            
            presentViewController(ac, animated: true, completion: nil)
            
            }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
        
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let item = itemStore.allItems[indexPath.row]
        let dvc = DetailViewController(item: item, itemStore: itemStore, imageStore: imageStore)
        showViewController(dvc, sender: self)
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.rowHeight = 44
        
        let nib = UINib(nibName: "ItemCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ItemCell")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}
