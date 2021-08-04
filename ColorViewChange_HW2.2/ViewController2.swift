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
    
    @IBOutlet weak var redQuantity: UILabel!
    @IBOutlet weak var greenQuantity: UILabel!
    @IBOutlet weak var blueQuantity: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var delegate: TransferColorDelegate!
    var resultV: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        red.maximumValue = 100
        green.maximumValue = 100
        blue.maximumValue = 100
        
        resultView.backgroundColor = resultV
        setValue(for: redQuantity, greenQuantity , blueQuantity)
        setValue(for: redTF, greenTF, blueTF)
    
        setSliders()
        
        red.value = Float(red.value * 100)
        green.value = Float(green.value * 100)
        blue.value = Float(blue.value * 100)
        
        redQuantity.text = String(Int(red.value))
        greenQuantity.text = String(Int(green.value))
        blueQuantity.text = String(Int(blue.value))
        
        redTF.text = String(Int(red.value))
        greenTF.text = String(Int(green.value))
        blueTF.text = String(Int(blue.value))


    }
   
    private func RGBColors() {
        resultView.backgroundColor = UIColor(
            red: CGFloat(red.value)/100,
            green: CGFloat(green.value)/100,
            blue: CGFloat(blue.value)/100,
            alpha: 1
        )}
    
    private func setSliders() {
        let ciColor = CIColor(color: resultV)
        red.value = Float(ciColor.red)
        green.value = Float(ciColor.green)
        blue.value = Float(ciColor.blue)
    }
    
    @IBAction func sliders(_ sender: UISlider) {
        switch sender {
        case red:
            setValue(for: redQuantity)
            setValue(for: redTF)
        case green:
            setValue(for: greenQuantity)
            setValue(for: greenTF)
        default:
            setValue(for: blueQuantity)
            setValue(for: blueTF)
        }
        RGBColors()
    }
    
    @IBAction func donePressed() {
        ifTFIsNill()
        equality()
        RGBColors()
    }
        
    func equality() {
        redQuantity.text = redTF.text
        greenQuantity.text = greenTF.text
        blueQuantity.text = blueTF.text
        
        red.value = Float(redTF.text ?? "error") ?? 666
        green.value = Float(greenTF.text ?? "error") ?? 666
        blue.value = Float(blueTF.text ?? "error") ?? 666
    }
    
    func ifTFIsNill() {
        print("print")
        if redTF.text?.isEmpty == true || greenTF.text?.isEmpty == true || blueTF.text?.isEmpty == true {
            redTF.text = redQuantity.text
            greenTF.text = greenQuantity.text
            blueTF.text = blueQuantity.text
        }
    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.0f", slider.value)
    }
    
    @IBAction func closeButtonPressed() {
        delegate.transferColor(resultView.backgroundColor ?? .brown)
        dismiss(animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redQuantity: label.text = string(from: red)
            case greenQuantity: label.text = string(from: green)
            default: label.text = string(from: blue)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF: textField.text = string(from: red)
            case greenTF: textField.text = string(from: green)
            default: textField.text = string(from: blue)
            }
        }
    }
}


extension ViewController2: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTF:
                red.setValue(currentValue, animated: true)
                setValue(for: redQuantity)
            case greenTF:
                green.setValue(currentValue, animated: true)
                setValue(for: greenQuantity)
            default:
                blue.setValue(currentValue, animated: true)
                setValue(for: blueQuantity)
            }
            
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            title:"Done",
            style: .done,
            target: self,
            action: #selector(donePressed)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
}
