//
//  HomeViewController.swift
//  VividOfficial
//
//  Created by Anton Horvath on 8/9/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var header : UIView?
    
    var postsCollection : UICollectionView?
    
    let tagView : UIView = {
       let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        configurePosts()
        
        addSubviews()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        header = self.setupHeader()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        postsCollection?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+view.height/12, width: view.width, height: view.height-(view.safeAreaInsets.top+view.height/12))
    }
    
    private func addSubviews() {
        view.addSubview(postsCollection!)
    }
    
}
