//
//  CameraViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/19.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class CameraViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var tangoTextField: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
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
        newAddress.photo = photoImageView.image?.jpegData(compressionQuality: 1)!
        
        //saveボタンを押すと前の画面に自動的にもどる
        //self.navigationController?.popViewController(animated: true)
        
//        if tangoTextField.text == "" && photoImageView.image == nil {
        
        if photoImageView.image == nil {
            let alert = UIAlertController(
                title: "保存できません",
                message: "写真を入力してください",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
        } //else {
//            try! realm.write {
//                realm.add(newAddress)
//            }
//            self.navigationController?.popViewController(animated: true)
//        }
        
        if tangoTextField.text == "" {
            let alert = UIAlertController(
                        title: "保存できません",
                        message: "名前を入力してください",
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: nil
                    ))
                    present(alert, animated: true, completion: nil)
            //        tangoTextField.text = ""
        } else {
            try! realm.write {
                realm.add(newAddress)
            }
            self.navigationController?.popViewController(animated: true)
        }
        
//        try! realm.write {
//            realm.add(newAddress)
//        }
        
//        self.navigationController?.popViewController(animated: true)
        
        
        
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = photoImage
        tangoTextField.delegate = self
        
//        var mojiArray: [Dictionary<String, String>] = []
//        if saveData.array(forKey: "SHIRITORI") != nil {
//            mojiArray = saveData.array(forKey: "SHIRITORI") as! [Dictionary<String, String>]
//        }

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
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
