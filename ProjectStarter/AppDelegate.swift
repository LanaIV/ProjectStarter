//
//  AppDelegate.swift
//  ProjectStarter
//
//  Created by Lana on 23/02/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import UIKit

import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        configureFabric()

        return true
    }

    private func configureFabric() {
        Fabric.with([Crashlytics.self])
    }

}

