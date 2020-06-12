//
//  CameraViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/19.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var tangoTextField: UITextField!
//    @IBOutlet var kazuTextField: UITextField!
    
    let realm = try! Realm()
    
//    let imageData: NSData = UIImagePNGRepresentation(photoImageView) as! NSData
    
//    let imageData = UIImagePNGRepresentation(photoImageView)
    
//    let imageData = UIImage(named:"photoImageView")!
//    let photoImageView = UIImagePNGRepresentation(imageView.image!) as NSData?
    
    var photoImage : UIImage!
    let images = UIImage(named: "photoImage")
    
//    let image = UIImage(named: "photoImageView")
//    let UIImageView = UIImage()
//    let pngData = image.toPNGData()
    
//    var mojiArray: [Dictionary<String, String>] = []
//    let saveData = UserDefaults.standard
    
    
//    @IBOutlet var mojilabel: UILabel!
    
    @IBAction func takePhoto() {
        
//        presentPickerController(sourceType: .camera)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            print("error")
        }
        
    }
    
    @IBAction func addAddress() {
        let newAddress = Address()
        newAddress.tango = tangoTextField.text!
//        newAddress.kazu = Int(kazuTextField.text!)!
        
        
//        newAddress.photo = UIImage(photoImageView.image!)!
        
        try! realm.write {
            realm.add(newAddress)
        }
        
//        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
//        let alert = UIAlertController(
//                    title: "入力完了", message: "文字の入力が完了しました", preferredStyle: .alert
//                )
//                alert.addAction(UIAlertAction(
//                    title: "OK", style: .default, handler: nil
//                ))
        
        
//        let mojiWaking = ["moji": mojiTextField.text!]
//        mojiArray.append(mojiWaking)
//        saveData.set(mojiArray, forKey: "SHIRITORI")
//
//        let alert = UIAlertController(
//            title: "入力完了", message: "文字の入力が完了しました", preferredStyle: .alert
//        )
//        alert.addAction(UIAlertAction(
//            title: "OK", style: .default, handler: nil
//        ))
//        present(alert, animated: true, completion: nil)
//        mojiTextField.text = ""
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    @IBAction func input() {
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = photoImage
        
//        var mojiArray: [Dictionary<String, String>] = []
//        if saveData.array(forKey: "SHIRITORI") != nil {
//            mojiArray = saveData.array(forKey: "SHIRITORI") as! [Dictionary<String, String>]
//        }

        // Do any additional setup after loading the view.
    }
    
    
//    public extension UIImage {
//
//        public func toPNGData() -> Data {
//            guard let photoImageView = self.pngData() else {
//                return Data()
//            }
////            return data
//            return photoImageView
////            return image
//        }
        
//        public func toJPEGData() -> Data {
//            guard let data = self.jpegData(compressionQuality: 1.0) else {
//                return Data()
//            }
//        }
        
//    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
//            let picker = UIImagePickerController()
//            picker.sourceType = sourceType
//            picker.delegate = self
//            self.present(picker, animated: true, completion: nil)
//        }

        photoImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
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
