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
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var delegate: TransferColorDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        red.value = 30
        green.value = 60
        blue.value = 90
        
        let redInt = Int(red.value)
        let greenInt = Int(green.value)
        let blueInt = Int(blue.value)
        
        redQuantity.text = String(redInt)
        greenQuantity.text = String(greenInt)
        blueQuantity.text = String(blueInt)
        
        RGBColors()
    }
    
    func devide(for TFld: UITextField...) {
        for tf in TFld {
            switch tf.tag {
            case 0:
                red.value = Float(redTF.text ?? "") ?? 0
            case 1:
                green.value = Float(greenTF.text ?? "") ?? 0
            default:
                blue.value = Float(blueTF.text ?? "") ?? 0
            }}}
    
    private func RGBColors() {
        resultView.backgroundColor = UIColor(
            red: CGFloat(red.value)/100,
            green: CGFloat(green.value)/100,
            blue: CGFloat(blue.value)/100,
            alpha: 1
        )}
    
    @IBAction func sliders(_ sender: UISlider) {
        RGBColors()
        devide(for: redTF)
        
        switch sender {
        case red:
            hernyaZalupnaya(for: redQuantity)
        case green:
            hernyaZalupnaya(for: greenQuantity)
        default:
            hernyaZalupnaya(for: blueQuantity)
        }}
    
    private func hernyaZalupnaya(for labels: UILabel...) {
        for label in labels {
            switch label {
            case redQuantity:
                redQuantity.text = String(Int(red.value))
            case greenQuantity:
                greenQuantity.text = String(Int(green.value))
            default:
                blueQuantity.text = String(Int(blue.value))
            }}}
    
    @IBAction func donePressed() {
        delegate.transferColor(resultView.backgroundColor ?? .brown)
        dismiss(animated: true)
    }}


