//
//  ScoreViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/25.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift
//import CoreMotion

//class photoImage: ScoreViewController

class ScoreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.tangoLabel.text = addresses[indexPath.row].tango
        //    cell.photoImageView.image = photoImage
        
        return cell
    }
    
    var score: Int = 1000
    let defaults: UserDefaults = UserDefaults.standard
    
    @IBOutlet var stepslabel: UILabel!
    @IBOutlet var numberlabel: UILabel!
    @IBOutlet var scorelabel: UILabel!
    
    var number: Int = 0
    
    var number1: Int = 0
    var number2: Int = 5
    var number3: Int = 3
    
    let realm = try! Realm()
    var addresses = try! Realm().objects(Address.self)
    var notificationToken: NotificationToken?
//    let results = realm.objects(Address.self)
//    let count = results.count
    
    var stepString = String()
    
//    var kosuuString = String()
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        //scorelabel.textにnumberlabelとstepslabelを掛け算したスコアを表示
        number1 = Int(number2) * Int(number3)
        scorelabel.text = String(number1)
        
        //realmに保存してあるデータ数をlabelに表示
        let results = realm.objects(Address.self)
        let count = results.count
        number = count
        numberlabel.text = String(number)
        
//            self.collectionView.reloadData() // データの再読み込み
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepslabel.text = stepString
        
//        numberlabel.text = kosuuString

        print(Realm.Configuration.defaultConfiguration.fileURL!)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toTop() {
        //        self.dismiss(animated: true, completion: nil)
        
        let realm = try! Realm()
        try! realm.write{
            realm.deleteAll()
            
            
            let score: Int = 1000
            
            let highScore1: Int = defaults.integer(forKey: "score1")
            let highScore2: Int = defaults.integer(forKey: "score2")
            let highScore3: Int = defaults.integer(forKey: "score3")
            
            if score > highScore1 {
                defaults.set(score, forKey: "score1")
                defaults.set(highScore1, forKey: "score2")
                defaults.set(highScore2, forKey: "score3")
            } else if score > highScore2 {
                defaults.set(score, forKey: "score2")
                defaults.set(highScore2, forKey: "score3")
            } else if score > highScore3 {
                defaults.set(score, forKey: "score3")
            }
            defaults.synchronize()
        }
//        self.collectionView.reloadData()
        
        
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
