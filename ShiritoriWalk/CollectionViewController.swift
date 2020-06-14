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
    @IBOutlet var scorelabel: UILabel!
    @IBOutlet var numberlabel: UILabel!
    var number: Int = 0
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0
    
//    var number2 = stepslabel.text!
//    var number3 = numberlabel.text!
//    var number2 = String(stepslabel.text!)
//    var number3 = String(numberlabel.text!)
    
    @IBAction func select() {
//        String(number2) = stepslabel.text
//        String(number3) = numberlabel.text
//        number1 = number2 * number3
        number1 = Int(number2) * Int(number3)
        scorelabel.text = String(number1)
    }
    
    var stepString = String()
    
    let realm = try! Realm()
    let addresses = try! Realm().objects(Address.self)
    var notificationToken: NotificationToken?
    
    @IBAction func cancel() {
           dismiss(animated: true, completion: nil)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Next" {
            //遷移先のViewControllerを取得
            let next = segue.destination as? ScoreViewController
            //用意した遷移先の変数に値を渡す
            next?.stepString = self.stepslabel.text!
            next?.kosuuString = self.numberlabel.text!
        }
        
    }
    
    @IBAction func toNext(_ sender: Any) {
        performSegue(withIdentifier: "Next", sender: nil)
    }
    
    let pedometer = CMPedometer()
    var results = "n/a"
    
//    let photos = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.collectionView.reloadData() // データの再読み込み
        
        //realmに保存してあるデータ数をlabelに表示
        let results = realm.objects(Address.self)
        let count = results.count
        number = count
        numberlabel.text = String(number)
        numberlabel.isHidden = true
        
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
