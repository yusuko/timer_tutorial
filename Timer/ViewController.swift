//
//  ViewController.swift
//  Timer
//
//  Created by 安西佑介 on 2019/03/31.
//  Copyright © 2019 安西佑介. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var timer: Timer?
    var currentSeconds = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var label: UILabel!
    
    @IBAction func tenSecButtonTapped(_ sender: Any) {
        start(seconds: 10)
    }
    @IBAction func threeMinButtonTapped(_ sender: Any) {
        start(seconds: 180)
    }
    @IBAction func fiveMinButtonTapped(_ sender: Any) {
        start(seconds: 300)
    }
    func start(seconds: Int) {
        currentSeconds = seconds
        label.text = "残り\(currentSeconds)秒"
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(ViewController.update),
                                     userInfo: nil,
                                     repeats: true)
    }
    @objc func update() {
        currentSeconds -= 1
        label.text = "残り\(currentSeconds)秒"
        if (currentSeconds == 0) {
            timer?.invalidate()
            let soundId: SystemSoundID = 1005
            AudioServicesPlayAlertSound(soundId)
        }
    }
}

