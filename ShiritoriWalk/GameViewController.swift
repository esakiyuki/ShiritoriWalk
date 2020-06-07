//
//  GameViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/19.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
//import CoreMotion

class GameViewController: UIViewController {
    
//    @IBOutlet var stepslabel: UILabel!
    @IBOutlet var themalabel: UILabel!
    
    let hiraganaArray:[String] = ["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を"]
    
    @IBAction func set() {
        
//        themalabel.text = hiraganaArray[index]
//        hiraganaArray.shuffle()
        let hiraganaIndex = Int.random(in: 0...43)
        print("お題: \(hiraganaIndex)")
        themalabel.text = hiraganaArray[hiraganaIndex]
        
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
//       let pedometer = CMPedometer()
//
//           var results = "n/a"
    
//    func startUpdates(from start: Date,
//    withHandler handler: @escaping CMPedometerHandler)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CMPedometerの確認
//        if(CMPedometer.isStepCountingAvailable()){
//            self.pedometer.startUpdates(from: NSDate() as Date) {
//                (data: CMPedometerData?, error) -> Void in
//
//                DispatchQueue.main.async(execute: { () -> Void in
//                    if(error == nil){
                        // 歩数 NSNumber?
//                        let steps = data!.numberOfSteps
//                        let results:String = String(format:"steps: %d", steps.intValue)
//
//                        self.stepslabel.text = results
//                    }
//                })
//            }
//        }
        
//        deinit {
//            pedometer.stopUpdates()
//        }

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
