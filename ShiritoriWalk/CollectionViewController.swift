//
//  CollectionViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/06/05.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift
import CoreMotion

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var stepslabel: UILabel!
    
    var stepString = String()
    
    let realm = try! Realm()
    let addresses = try! Realm().objects(Address.self)
//    var notificationToken: NotificationToken?
    
    @IBAction func cancel() {
           dismiss(animated: true, completion: nil)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Next" {
            //遷移先のViewControllerを取得
            let next = segue.destination as? ScoreViewController
            //用意した遷移先の変数に値を渡す
            next?.stepString = self.stepslabel.text!
        }
    }
    
    @IBAction func toNext(_ sender: Any) {
        performSegue(withIdentifier: "Next", sender: nil)
    }
    
    let pedometer = CMPedometer()
    var results = "n/a"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.collectionView.reloadData() // データの再読み込み
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.reloadData()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        // レイアウト設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.collectionViewLayout = layout
        
        // CMPedometerの確認
        if(CMPedometer.isStepCountingAvailable()){
            self.pedometer.startUpdates(from: NSDate() as Date) {
                (data: CMPedometerData?, error) -> Void in
                       
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        // 歩数 NSNumber?
                        let steps = data!.numberOfSteps
                        let results:String = String(format:"%d", steps.intValue)
                               
                        self.stepslabel.text = results
                    }
                })
            }
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        let tangoLabel = cell.contentView.viewWithTag(1) as! UILabel
        cell.tangoLabel.text = addresses[indexPath.row].tango
        
        let photoImageView = cell.contentView.viewWithTag(2)  as! UIImageView
        cell.photoImageView.image = UIImage(data: addresses[indexPath.row].photo!)!
        
        return cell
//        return addresses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let horizontalSpace : CGFloat = 30
        let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
        return CGSize(width: cellSize, height: cellSize)
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
