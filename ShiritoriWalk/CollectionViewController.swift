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
    
    var score: Int = 1000
    let defaults: UserDefaults = UserDefaults.standard
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var stepslabel: UILabel!
    
    @IBOutlet var numberlabel: UILabel!
    var number: Int = 0
    
//    var step = Int()
    var stepString = String()
//    var stepslabel = String()
//    var stepslabel = Int()
    
//    var photoImage: UIImage!
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        let nextVC = segue.destination as? CollectionViewController
        //        NextVC?.String = stepslabel.text
        ////        NextVC?.Int = stepslabel.text
        
        if segue.identifier == "Next" {
            //遷移先のViewControllerを取得
            let next = segue.destination as? ScoreViewController
            //用意した遷移先の変数に値を渡す
            next?.stepString = self.stepslabel.text!
            next?.kosuuString = self.numberlabel.text!
        }
        
        
//        if segue.identifier == "Next" {
//            // 2. 遷移先のViewControllerを取得
//            _ = segue.destination as? ScoreViewController
//            // 3. １で用意した遷移先の変数に値を渡す
//            let results = realm.objects(Address.self)
//            let count = results.count
//            number = count
////            numberlabel.text = String(number)
//        }
    }
    
//    @IBAction func kosuu() {
//        let results = realm.objects(Address.self)
//        let count = results.count
//        number = count
//        numberlabel.text = String(number)
//    }
    
    
    @IBAction func toNext(_ sender: Any) {
        performSegue(withIdentifier: "Next", sender: nil)
        
        let results = realm.objects(Address.self)
        let count = results.count
        number = count
        numberlabel.text = String(number)
        
//        score = 1000
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
    
    let pedometer = CMPedometer()
    var results = "n/a"
    
//    let photos = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.collectionView.reloadData() // データの再読み込み
        
//        self.navigationItem.title = "title font test"
//        self.navigationController?.navigationBar.titleTextAttributes
//            = [NSFontAttributeName: UIFont(name: "Times New Roman", size: 15)!]
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
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
//        notificationToken = addresses.observe { [weak self] _ in
//            self?.collectionView.reloadData()
//        }
        
//        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 18 //表示するセルの数
//        return self.count
        return addresses.count
    }
    
    var photoImage: UIImage!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.tangoLabel.text = addresses[indexPath.row].tango
        cell.photoImageView.image = photoImage
        
        return cell
        
//        cell.photoImageView.image = UIImage(addresses[indexPath.row].photo)
        
//        var photoImage = [UIImage]()
//        photoImage.append(UIImage(data: Data(base64Encoded: addressesValue.imageString, options: .ignoreUnknownCharacters)!)!)
        
//        for addressesValue in addresses {
//            var image = [UIImage]()
//            image.append(UIImage(data: Data(base64Encoded: addressesValue.imageString, options: .ignoreUnknownCharacters)!)!)
//
//            cell.photoImageView.image = photoImage[indexPath.row]
//        }
        
//        photoImage = UIImage(data: Data(base64Encoded: addressesValue.imageString, options: .ignoreUnknownCharacters)!)!
//
//        let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
////        cell.photoImage = UIImage(named: addresses[indexPath.row])
//        let photoImage = UIImage(named: addresses[indexPath.row])
//        photoImageView.image = photoImage
//
//        let tangoLabel = cell.contentView.viewWithTag(2) as! UILabel
//        cell.tangoLabel.text = addresses[indexPath.row].tango
        
        
//        cell.photoImageView.image = addresses[indexPath.row].photo
//        cell.kazuLabel.text = String(addresses[indexPath.row].kazu)
        
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
