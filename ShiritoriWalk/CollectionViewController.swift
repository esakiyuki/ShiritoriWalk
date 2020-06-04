//
//  CollectionViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/06/05.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

//class CollectionViewController: UIViewController {
class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var tangoLabel: UILabel!
    @IBOutlet var kazuLabel: UILabel!
    
    let realm = try! Realm()
    let addresses = try! Realm().objects(Address.self)
    var notificationToken: NotificationToken?
    
    @IBAction func cancel() {
           dismiss(animated: true, completion: nil)
       }
    
//    let photos = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
//        notificationToken = addresses.observe { [weak self] _ in
//            self?.tableView.reloadData()
//        }
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18 //表示するセルの数
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
//        return addresses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 20
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
