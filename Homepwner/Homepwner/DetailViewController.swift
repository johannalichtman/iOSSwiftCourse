//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Johanna Lichtman on 2/17/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var serialNumberField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var assetTypeButton: UIBarButtonItem!
    
    var itemStore: ItemStore
    let imageStore: ImageStore
    let item: Item
    
    var cancelClosure: (() -> ())?
    var saveClosure: (() -> ())?
    
    @IBAction func takePicture(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera
        }
        else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.Popover
        // UI Popover must be told where it needs to point to on the screen
        imagePicker.popoverPresentationController?.barButtonItem = sender as UIBarButtonItem
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func showAssetTypePicker(sender: AnyObject){
        view.endEditing(true)
        
        let avc = AssetTypeViewController(item: item, itemStore: itemStore)
        showViewController(avc, sender: self)
    }

    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }


    var isNew: Bool = false {
        didSet {
            if isNew{
                let cancelItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancel:")
                navigationItem.leftBarButtonItem = cancelItem
                
                let doneItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "save:")
                navigationItem.rightBarButtonItem = doneItem
            }
            else {
                navigationItem.leftBarButtonItem = navigationItem.backBarButtonItem
                navigationItem.rightBarButtonItem = nil
            }
        }
    }
    

    
    func save(sender: AnyObject){
        saveClosure?()
    }
    
    func cancel(sender: AnyObject){
        cancelClosure?()
    }
    
    
    init(item: Item, itemStore: ItemStore, imageStore: ImageStore){
        self.item = item
        self.itemStore = itemStore
        self.imageStore = imageStore
        super.init(nibName: "DetailViewController", bundle: nil)
        
        navigationItem.title = item.name
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("Use init(itemSTore:) instead")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        
//        if let sn = item.serialNumber{
//            serialNumberField.text = sn
//        }
//        
        valueField.text = "\(item.valueInDollars)"
        
        let date = item.dateCreated
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        
        dateLabel.text = dateFormatter.stringFromDate(date)
        
        let key = item.itemKey
        if let imageToDisplay = imageStore.imageForKey(key) {
            imageView.image = imageToDisplay
        }
        
        if let typeLabel = item.assetType.valueForKey("label") as? String {
            assetTypeButton.title = typeLabel
        }
        else {
            assetTypeButton.title = "None"
        }
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
        item.name = nameField.text
        item.serialNumber = serialNumberField.text
        item.valueInDollars = valueField.text.toInt() ?? 0
        
    }
    

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        // Get picked image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        
        // Store the image in the ImageStore for the items's key
        imageStore.setImage(image, forKey:item.itemKey)
        
        // Put that image onto the screen in our image view
        imageView.image = image
        
        // Take image picker off the screen
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
