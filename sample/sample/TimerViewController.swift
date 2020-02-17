//
//  TimerViewController.swift
//  sample
//
//  Created by Vinay Raj K on 30/07/19.
//  Copyright © 2019 Vinay Raj K. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet var customTimerView: CustomTimer!
    
    var timer : Timer!
    
    var progressValue: Float = 0.0
    
    let timeIntervalInSecs: Float = 60.0
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customTimerView.simpleShape()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateValue), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func updateValue(){
        progressValue += 1/timeIntervalInSecs
        counter += 1
        customTimerView.progress = progressValue
        customTimerView.label.text = "\(counter)"
        if counter == Int(timeIntervalInSecs){
            timer.invalidate()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
