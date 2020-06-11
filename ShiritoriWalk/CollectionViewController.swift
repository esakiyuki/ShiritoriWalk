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

//class CollectionViewController: UIViewController {
class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var stepslabel: UILabel!
    
//    var step = Int()
    var stepString = String()
//    var stepslabel = String()
//    var stepslabel = Int()
    
    var photoImage: UIImage!
    
//    @IBOutlet var photoImageView: UIImageView!
//    @IBOutlet var tangoLabel: UILabel!
    
    let realm = try! Realm()
    let addresses = try! Realm().objects(Address.self)
    var notificationToken: NotificationToken?
    
//    let photoImageView = UIImage(data: imageData)
    
//    let image = UIImage()
//    let pngData = photoImageView.toPNGData()
//    let pngImage = pngData.toImage()
    
    
    @IBAction func cancel() {
           dismiss(animated: true, completion: nil)
       }
    
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "Next", sender: nil)
    }
    
    let pedometer = CMPedometer()
    var results = "n/a"
    
//    let photos = []
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.collectionView.reloadData() // データの再読み込み
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.reloadData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.backgroundColor = .lightGray

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
        
//        public extension Data {
//
////            func tophotoImageView() -> UIImage {
//            public func toImage() -> UIImage {
//                guard let photoImageView = UIImage(data: self) else {
//                    return UIImage()
//                }
//                return photoImageView
//            }
//
//        }
        
//        self.datas = Address.allObjects()
//        self.datas.addNotificationBlock({[weak self] (results, change, error) in
//            self.collectionView.reloadData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        notificationToken = addresses.observe { [weak self] _ in
            self?.collectionView.reloadData()
        }
        
//        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as? CollectionViewController
        NextVC?.String = stepslabel.text
//        NextVC?.Int = stepslabel.text
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 18 //表示するセルの数
//        return self.count
        return addresses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.tangoLabel.text = addresses[indexPath.row].tango
//        cell.photoImageView.image = UIImage(addresses[indexPath.row].photo)
        
        cell.photoImageView.image = photoImage
        
//        cell.photoImageView.image = addresses[indexPath.row].photo
//        cell.kazuLabel.text = String(addresses[indexPath.row].kazu)
        
        return cell
//        return image
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
