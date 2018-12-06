//
//  AppDelegate.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initializeWindow()
        return true
    }
    
    private func initializeWindow() {
        let frame = UIScreen.main.bounds
        let window = UIWindow(frame: frame)
        let listWireframe = ListWireframe(window: window)
        listWireframe.showList()
        self.window = window
    }

}

