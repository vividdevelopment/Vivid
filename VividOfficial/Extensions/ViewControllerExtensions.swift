//
//  ViewControllerExtensions.swift
//  VividOfficial
//
//  Created by Anton Horvath on 8/9/21.
//

import UIKit

extension UIViewController {
    
    func setupView() {
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func setupHeader() -> UIView {
        
        let profileImage : UIImageView = {
           let image = UIImageView()
            image.image = UIImage(named: "profile")
            image.layer.masksToBounds = true
            image.contentMode = .scaleAspectFill
            return image
        }()
        
        let searchButton : UIButton = {
           let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            button.tintColor = .label
            button.contentMode = .scaleAspectFill
            return button
        }()
        
        let settingsButton : UIButton = {
           let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "gearshape"), for: .normal)
            button.tintColor = .label
            button.contentMode = .scaleAspectFill
            return button
        }()
        
        let inboxButton : UIButton = {
           let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "archivebox"), for: .normal)
            button.tintColor = .label
            button.contentMode = .scaleAspectFill
            return button
        }()
        
        let headerView : UIView = {
           let view = UIView()
            view.backgroundColor = .none
            return view
        }()
        
        // add all subviews
        view.addSubview(headerView)
        headerView.addSubview(profileImage)
        headerView.addSubview(searchButton)
        headerView.addSubview(settingsButton)
        headerView.addSubview(inboxButton)
        
        // layout views
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height/12)
        
        // icon size for all icons in the header
        let profilesize = headerView.height/2
        let iconsize = headerView.height/3
        let searchsize = headerView.height/3
        
        
        profileImage.frame = CGRect(x: 20, y: profilesize/2, width: profilesize, height: profilesize)
        profileImage.layer.cornerRadius = profileImage.height/2
        
        searchButton.frame = CGRect(x: profileImage.right+20, y: headerView.height/2-(searchsize-2.5)/2, width: searchsize, height: searchsize-2.5)
        
        inboxButton.frame = CGRect(x: headerView.width-20-searchsize, y: headerView.height/2-searchsize/2, width: searchsize, height: searchsize)
        
        settingsButton.frame = CGRect(x: inboxButton.left-20-iconsize, y: headerView.height/2-iconsize/2, width: iconsize, height: iconsize)
        
        return headerView
    }
    
    
}
