//
//  ViewController.swift
//  Facebook News Feed
//
//  Created by Евгений Липадат on 21.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "feedCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        navigationItem.title = "News Feed"
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.alwaysBounceVertical = true
        
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width, height: 400)
    }
    
    
    
    
    


}


