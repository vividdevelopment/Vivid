//
//  PostCollectionViewCell.swift
//  VividOfficial
//
//  Created by Anton Horvath on 8/9/21.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"
    
    var isMediaOverlayEnabled : Bool = false
    
    let imageTest : UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "mountains")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let postView : UIView = {
       let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    let infoView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let interactView : UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let commentButton : UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    let heartButton : UIButton = {
        let button = UIButton()
         button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
         button.tintColor = .white
         button.contentMode = .scaleAspectFill
         return button
    }()
    
    let optionsButton : UIButton = {
        let button = UIButton()
         button.setBackgroundImage(UIImage(systemName: "ellipsis"), for: .normal)
         button.tintColor = .white
         button.contentMode = .scaleAspectFill
         return button
    }()
    
    let profileImage : UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "profile")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    let caption : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "This is an example of the label we are testing to see if it is working or not"
        return label
    }()
    
    let scrollView : UIScrollView = {
       let view = UIScrollView()
        view.backgroundColor = .none
        return view
    }()
    
    let username : UILabel = {
       let label = UILabel()
        label.text = "anton"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        return label
    }()
    
    let likes : UILabel = {
       let label = UILabel()
        label.text = "4.2k Likes"
        return label
    }()
    
    let shares : UILabel = {
       let label = UILabel()
        label.text = "33 Shares"
        return label
    }()
    
    let comments : UILabel = {
       let label = UILabel()
        label.text = "3 Comments"
        return label
    }()
    
    let age : UILabel = {
       let label = UILabel()
        label.text = "3 Weeks Ago"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        postView.frame = CGRect(x: 0, y: 0, width: width, height: width/(1920/1080))
        infoView.frame = CGRect(x: 0, y: postView.bottom, width: width, height: height-postView.bottom)
        interactView.frame = CGRect(x: 0, y: infoView.top, width: width, height: postView.height/4)
        
        profileImage.frame = CGRect(x: 20, y: infoView.height/4, width: infoView.height/2, height: infoView.height/2)
        profileImage.layer.cornerRadius = profileImage.height/2
        
        caption.frame = CGRect(x: profileImage.right+20, y: profileImage.top, width: width-20-(profileImage.right+20), height: profileImage.height)
        
        scrollView.frame = CGRect(x: 20, y: profileImage.bottom, width: width-40, height: 20)
        
        username.sizeToFit()
        
        username.frame = CGRect(x: 0, y: 1, width: username.width, height: 18)
        
        imageTest.frame = postView.bounds
        
        
    }
    
    private func addSubviews() {
        // media view
        addSubview(postView)
        
        addSubview(imageTest)
        
        // interaction buttons for media view
        addSubview(interactView)
        
        interactView.addSubview(commentButton)
        interactView.addSubview(heartButton)
        interactView.addSubview(optionsButton)
        
        // information for the media view
        addSubview(infoView)
        
        infoView.addSubview(profileImage)
        infoView.addSubview(caption)
        infoView.addSubview(scrollView)
        
        scrollView.addSubview(username)
        scrollView.addSubview(likes)
        scrollView.addSubview(shares)
        scrollView.addSubview(comments)
        scrollView.addSubview(age)
        
        
    }
    
    private func addDelegates() {
        
        let mediaOverlayGesture = UITapGestureRecognizer()
        mediaOverlayGesture.numberOfTapsRequired = 1
        mediaOverlayGesture.numberOfTouchesRequired = 1
        mediaOverlayGesture.addTarget(self, action: #selector(didTapPost))
        postView.addGestureRecognizer(mediaOverlayGesture)
        
    }
    
    @objc func didTapPost() {
        print("yup")
        if !isMediaOverlayEnabled {
            UIView.animate(withDuration: 0.3, animations: {
                self.interactView.frame = CGRect(x: 0, y: self.postView.bottom-self.postView.height/4, width: self.width, height: self.postView.height/4)
            })
            isMediaOverlayEnabled = true
        }
        else {
            UIView.animate(withDuration: 0.3, animations: {
                self.interactView.frame = CGRect(x: 0, y: self.infoView.top, width: self.width, height: self.postView.height/4)
            })
            isMediaOverlayEnabled = false
        }
    }
    
}
