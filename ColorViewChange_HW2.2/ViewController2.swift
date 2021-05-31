//
//  ViewController2.swift
//  ColorViewChange_HW2.2
//
//  Created by Vladimir Syleimanov on 27.05.2021.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var resultView: UIView!

    @IBOutlet var red: UISlider!
    @IBOutlet var green: UISlider!
    @IBOutlet var blue: UISlider!

    @IBOutlet var redQuantity: UILabel!
    @IBOutlet var greenQuantity: UILabel!
    @IBOutlet var blueQuantity: UILabel!



    override func viewDidLoad() {
        super .viewDidLoad()
        
        resultView.layer.cornerRadius = 10

        red.maximumValue = 100
        green.maximumValue = 100
        blue.maximumValue = 100

        red.minimumValue = 0
        green.minimumValue = 0
        blue.minimumValue = 0
        
        red.value = 30
        green.value = 60
        blue.value = 90
        
        RGBColor()
        
        setValue(for: redQuantity, greenQuantity, blueQuantity)

    }

    
    
    @IBAction func RGBSliders(_ sender: UISlider) {
        RGBColor()
        
        switch sender {
        case red: setValue(for: redQuantity)
        case green: setValue(for: greenQuantity)
        default: setValue(for: blueQuantity)

        }
        
        
    }
    


    func RGBColor() {
            resultView.backgroundColor = UIColor(
                red: CGFloat(red.value)/100,
                green: CGFloat(green.value)/100,
                blue: CGFloat(blue.value)/100,
                alpha: 1)
            
    }
    
    
    private func setValue(for labels: UILabel...) {
        
        labels.forEach { label in
            switch label {
            case redQuantity:
                label.text = String(Int(red.value))
            case greenQuantity:
                label.text = String(Int(green.value))
            default:
                label.text = String(Int(blue.value))

            }
        }
  
    }

}

















//redQuantity.text = String(Int(red.value))
//greenQuantity.text = String(Int(green.value))
//blueQuantity.text = String(Int(blue.value))
