//
//  ExploreViewController.swift
//  VividOfficial
//
//  Created by Anton Horvath on 8/9/21.
//

import UIKit

class ExploreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        self.setupHeader()
    }

}
