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
    
//    var photoImage: UIImage!
    
    @IBOutlet var stepslabel: UILabel!
    @IBOutlet var numberlabel: UILabel!
    @IBOutlet var scorelabel: UILabel!
    
//    var collectionView: UICollectionView!collectionView
    
    let realm = try! Realm()
    var addresses = try! Realm().objects(Address.self)
    var notificationToken: NotificationToken?
    
//    var addresses: Results<CollectionViewCell>!
    
    
//    let pedometer = CMPedometer()
//    var results = "n/a"
    
    var stepString = String()
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
//            self.collectionView.reloadData() // データの再読み込み
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepslabel.text = stepString
        
//        self.collectionView.reloadData()
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        let realm = try! Realm()
//        self.addresses = realm.objects(CollectionViewCell.self)
//        self.collectionView.reloadData()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
//        notificationToken = addresses.observe { [weak self] _ in
//            self?.collectionView.reloadData()
//        }
        
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
        
        let realm = try! Realm()
        try! realm.write{
            realm.deleteAll()
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
