//
//  ViewController.swift
//  HeartSensation
//
//  Created by Anton ALLIOT on 5/20/17.
//  Copyright © 2017 HeartSensation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    var simpleBluetoothIO: SimpleBluetoothIO!
    var value: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleBluetoothIO = SimpleBluetoothIO(serviceUUID: "6e400001-b5a3-f393-e0a9-e50e24dcca9e", delegate: self)
    }

    @IBAction func sliderOnChange(_ sender: UISlider) {
        if (self.value != Int(sender.value)) {
            self.value = Int(sender.value)
            simpleBluetoothIO.writeValue(value: "Vibrate:\(Int(sender.value));")
        }
    }

}

extension ViewController: SimpleBluetoothIODelegate {
    func simpleBluetoothIO(simpleBluetoothIO: SimpleBluetoothIO, didReceiveValue value: Int8) {
        if value > 0 {
            view.backgroundColor = UIColor.yellow
        } else {
            view.backgroundColor = UIColor.black
        }
    }
}
