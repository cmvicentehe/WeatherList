//
//  ListVC.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    var presenter: ListPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ListVC: ListUI {}

