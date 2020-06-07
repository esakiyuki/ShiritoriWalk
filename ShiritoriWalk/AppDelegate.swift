//
//  AppDelegate.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/19.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        var config = Realm.Configuration(
//            schemaVersion: 4,
//            migrationBlock: { migration, oldSchemaVersion in
//                if (oldSchemaVersion &lt; 4) {}
//        })
//
//        Realm.Configuration.defaultConfiguration = config
//        config = Realm.Configuration()
//        config.deleteRealmIfMigrationNeeded = true
        
        
        
//        let config = Realm.Configuration(
//            schemaVersion: 1,
//            migrationBlock: { migration, oldSchemaVersion in
//                if (oldSchemaVersion &lt; 1) {}
//        })
//
//        Realm.Configuration.defaultConfiguration = config
//        let realm = try! Realm()
        
        
        
//        let config = Realm.Configuration(
//
//              schemaVersion: 0,
//
//                 migrationBlock: { migration, oldSchemaVersion in
//
//        if (oldSchemaVersion < 1) {
//
//        }})
//
//            Realm.Configuration.defaultConfiguration = config
//
//            let realm = try! Realm()
//            print(realm, "Realm")
//            print(config,"Realm Version")
        
        
        
            return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

