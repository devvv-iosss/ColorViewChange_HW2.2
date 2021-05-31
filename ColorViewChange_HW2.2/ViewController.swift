
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultView: UIView!
    
    @IBOutlet var red: UISlider!
    @IBOutlet var green: UISlider!
    @IBOutlet var blue: UISlider!
    
    
    @IBOutlet var redQuantity: UILabel!
    @IBOutlet var greenQuantity: UILabel!
    @IBOutlet var blueQuantity: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorChange()
        
        red.maximumValue = 100
        red.minimumValue = 0
        
        green.maximumValue = 100
        green.minimumValue = 0
        
        blue.maximumValue = 100
        blue.minimumValue = 0
        
        red.value = 30
        green.value = 60
        blue.value = 90
        
        colorChange()
    }
    
    @IBAction func sliders() {
        colorChange()
    
        
}
    
    private  func colorChange () {
        resultView.backgroundColor = UIColor(
            red: CGFloat(red.value)/100,
            green: CGFloat(green.value)/100,
            blue: CGFloat(blue.value)/100,
            alpha: 1)
        redQuantity.text = String(Int(red.value))
        greenQuantity.text = String(Int(green.value))
        blueQuantity.text = String(Int(blue.value))
        
        }
}
