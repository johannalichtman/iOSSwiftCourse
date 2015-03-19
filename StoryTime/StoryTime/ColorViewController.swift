//
//  ColorViewController.swift
//  StoryTime
//
//  Created by Johanna Lichtman on 2/19/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var existingColor = false
    var currentColorDescription: ColorDescription!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func dismiss(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true , completion: nil)
    }
    
    @IBAction func changeColor(sender: AnyObject) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        view.backgroundColor = newColor
        
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        
        if existingColor {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = currentColorDescription.color
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
            
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        view.backgroundColor = color
        textField.text = currentColorDescription.name
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        currentColorDescription.color = view.backgroundColor ?? UIColor.whiteColor()
        currentColorDescription.name = textField.text
    }
    
}
