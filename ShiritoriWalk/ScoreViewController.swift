//
//  ScoreViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/25.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
