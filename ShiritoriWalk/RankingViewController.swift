//
//  RankingViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/24.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    let defaults: UserDefaults = UserDefaults.standard
    
    @IBOutlet var rankingLabel1: UILabel!
    @IBOutlet var rankingLabel2: UILabel!
    @IBOutlet var rankingLabel3: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.collectionView.reloadData()
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        return addresses.count
        
        rankingLabel1.text = String(defaults.integer(forKey: "score1"))
        rankingLabel2.text = String(defaults.integer(forKey: "score2"))
        rankingLabel3.text = String(defaults.integer(forKey: "score3"))

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
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
