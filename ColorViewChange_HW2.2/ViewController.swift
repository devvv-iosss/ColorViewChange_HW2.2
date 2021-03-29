//
//  ViewController.swift
//  ColorViewChange_HW2.2
//
//  Created by dev on 26.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabelValue: UILabel!
    @IBOutlet var greenLabelValue: UILabel!
    @IBOutlet var blueLabelValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
       
        redSlider.value = 0.1
        greenSlider.value = 0.3
        blueSlider.value = 0.5
        
        setColor()
        changeOfValue()
    }
   
    @IBAction func rgbSliderAction() {
        setColor()
        changeOfValue()
    }
     
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func changeOfValue() {
        redLabelValue.text = String(format: "%.2f", redSlider.value)
        greenLabelValue.text = String(format:"%.2f", greenSlider.value)
        blueLabelValue.text = String(format:"%.2f", blueSlider.value)
    }
}

