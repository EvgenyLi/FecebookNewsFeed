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
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        navigationItem.title = "News Feed"
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.alwaysBounceVertical = true
        
        let markPost = Post()
        markPost.name = "Mark Zuckerberg"
        markPost.avatar = "mark"
        markPost.statusImage = "post_mark"
        markPost.likeLabelCount = "123K"
        markPost.shareCount = "122K Share 32K Views"
        markPost.statusText = "In an hour I’m going to testify in front of the Senate about how Facebook needs to take a broader view of our responsibility."
        let durovPost = Post()
        durovPost.name = "Pavel Durov"
        durovPost.avatar = "durov"
        durovPost.statusImage = "durov_image"
        durovPost.likeLabelCount = "456K"
        durovPost.shareCount = "2.3K Share 87K Views"
        durovPost.statusText = "Design is not just what it looks like and feels like. Design is how it works.\n\nBeing the richest man in the cemetery doesn't matter to me. Going to bed at night saying we've done something wonderful, that's what matters to me.\n\nSometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations."
        let muskPost = Post()
        muskPost.name = "Elon Musk"
        muskPost.avatar = "elon"
        muskPost.statusImage = "tesla"
        muskPost.likeLabelCount = "232K"
        muskPost.shareCount = "1K Share 21K Views"
        muskPost.statusText = "Live as if you were to die tomorrow; learn as if you were to live forever.\nThe weak can never forgive. Forgiveness is the attribute of the strong.\nHappiness is when what you think, what you say, and what you do are in harmony."
        posts.append(markPost)
        posts.append(durovPost)
        posts.append(muskPost)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        cell.post = posts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 405)
    }
    
    

} // end


