//
//  File.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/31.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import Foundation
import RealmSwift

class Address: Object {
    @objc dynamic var tango: String = ""
    @objc dynamic var photo: Data? = nil
    
//    @objc dynamic var photo: [UIImage] = []
//    @objc dynamic var image = Data()
//    @objc dynamic var image: UIImage? = nil
}
