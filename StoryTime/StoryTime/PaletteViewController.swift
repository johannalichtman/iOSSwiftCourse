//
//  PaletteViewController.swift
//  StoryTime
//
//  Created by Johanna Lichtman on 2/19/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

class PaletteViewController: UITableViewController {
    
    // colors property
    var colors: [ColorDescription] = [ColorDescription()]
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = colors[indexPath.row].name
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NewColor"{
            let newColorDescription = ColorDescription()
            colors.append(newColorDescription)
            
            if let nc = segue.destinationViewController as? UINavigationController {
                if let cvc = nc.topViewController as? ColorViewController {
                    cvc.currentColorDescription = newColorDescription
                    cvc.existingColor = false
                }
            }
        }
        else if segue.identifier == "ExistingColor" {
            if let row = tableView.indexPathForSelectedRow()?.row {
                let colorDescription = colors[row]
                
                if let cvc = segue.destinationViewController as? ColorViewController {
                    cvc.currentColorDescription = colorDescription
                    cvc.existingColor = true
                }
            }
        }
    }
    
}
