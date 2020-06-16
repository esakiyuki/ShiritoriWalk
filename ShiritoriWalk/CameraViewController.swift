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
    
    @IBAction func takePhoto() {
        
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
        
//        if photoImage == nil {
        if photoImageView.image == nil {
            let alert = UIAlertController(
                title: "保存できません",
                message: "写真を撮影してください",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
        }
//        else {
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
        
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        photoImageView.image = photoImage
        tangoTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
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
