//
//  ScoreViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/25.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
//import CoreMotion

class ScoreViewController: UIViewController {
    
    @IBOutlet var stepslabel: UILabel!
    @IBOutlet var numberlabel: UILabel!
    @IBOutlet var scorelabel: UILabel!
    
//    let pedometer = CMPedometer()
//    var results = "n/a"
    
    var stepString = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepslabel.text = stepString
        
        // CMPedometerの確認
//        if(CMPedometer.isStepCountingAvailable()){
//            self.pedometer.startUpdates(from: NSDate() as Date) {
//                (data: CMPedometerData?, error) -> Void in
//
//                DispatchQueue.main.async(execute: { () -> Void in
//                    if(error == nil){
//                        // 歩数 NSNumber?
//                        let steps = data!.numberOfSteps
//                        let results:String = String(format:"%d", steps.intValue)
//
//                        self.stepslabel.text = results
//                    }
//                })
//            }
//        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toTop() {
//        self.dismiss(animated: true, completion: nil)
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func toTop(_ sender: Any) {
//        let vc = UIStoryboard(name: "ViewController", bundle: Bundle.main)
//            .instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        navigationController?.pushViewController(vc, animated: true)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
