//
//  ViewController3.swift
//  ColorViewChange_HW2.2
//
//  Created by Vladimir Syleimanov on 30.05.2021.
//

import UIKit


class ViewController3: UIViewController {
    
    @IBOutlet var resultView: UIView!
    
    @IBOutlet var red: UISlider!
    @IBOutlet var green: UISlider!
    @IBOutlet var blue: UISlider!
    
    @IBOutlet var redQuantity: UILabel!
    @IBOutlet var greenQuantity: UILabel!
    @IBOutlet var blueQuantity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        red.minimumValue = 0
        green.minimumValue = 0
        blue.minimumValue = 0
        
        red.maximumValue = 100
        green.maximumValue = 100
        blue.maximumValue = 100
        
        red.value = 30
        green.value = 60
        blue.value = 90

        RGBFunc()
        setValue(for: redQuantity, greenQuantity, blueQuantity)
        
    }
    
    @IBAction func sliderAct(_ sender: UISlider) {
        RGBFunc()
        
        switch sender {
        case red: setValue(for: redQuantity)
        case green: setValue(for: greenQuantity)
        default: setValue(for: blueQuantity)
            
        }
    }
    
    private func RGBFunc() {
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
                label.text =  String(Int(red.value))
            case greenQuantity:
                label.text = String(Int(green.value))
            default:
                label.text = String(Int(blue.value))
          
            }
        }
    }


    // Значения RGB
    private func string(from slider: UISlider) -> String {
        String(Int(slider.value))
        //конвертируем строку из слайдера
    }
}

 
