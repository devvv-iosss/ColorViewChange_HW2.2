//
//  ResultVCViewController.swift
//  ColorViewChange_HW2.2
//
//  Created by Vladimir Syleimanov on 27.07.2021.
//



import UIKit

protocol TransferColorDelegate {
    func transferColor(_ color: UIColor)
}

class ResultVCViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ViewController2
        resultVC.delegate = self
        resultVC.resultV = view.backgroundColor
    }
}

extension ResultVCViewController: TransferColorDelegate {
    func transferColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
