//
//  HomeViewControllerDelegates.swift
//  VividOfficial
//
//  Created by Anton Horvath on 8/9/21.
//

import UIKit

extension HomeViewController {
    
    func configurePosts() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let infoHeight = view.width/(1920/1080)/3
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.width, height: view.width/(1920/1080)+infoHeight)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        postsCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        postsCollection?.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        postsCollection?.backgroundColor = .systemBackground
        postsCollection?.showsVerticalScrollIndicator = false
        postsCollection?.delegate = self
        postsCollection?.dataSource = self
    }
    
}
