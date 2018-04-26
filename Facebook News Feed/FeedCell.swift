//
//  FeedCell.swift
//  Facebook News Feed
//
//  Created by Евгений Липадат on 21.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            if let name = post?.name{
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)])
                attributedText.append(NSAttributedString(string: "\nApril 20 at 5:17pm · Moscow · ", attributes:
                    [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.lightGray]))
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedText.string.count))
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "globe_small")
                attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attachment))
                nameLabel.attributedText = attributedText
            }
            guard let statusText = post?.statusText else {return}
            statusTextView.text = statusText
            guard let avatar = post?.avatar else {return}
            profileImageName.image = UIImage(named: avatar)
            guard let statusImage = post?.statusImage else {return}
            postImage.image = UIImage(named: statusImage)
            guard let likelCount = post?.likeLabelCount else {return}
            likeLabelCount.text = likelCount
            guard let shareCount = post?.shareCount else {return}
            shareLabelCount.text = shareCount
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        addSubViewsAndlayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageName: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let statusTextView: UILabel = {
        let textView = UILabel()
        textView.lineBreakMode = .byWordWrapping
        textView.numberOfLines = 3
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let likeImageView: UIImageView = {
        let likeLabel = UIImageView()
        likeLabel.image = UIImage(named: "like_blue")
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        return likeLabel
    }()
    
    let heartImageView: UIImageView = {
        let heartImage = UIImageView()
        heartImage.image = UIImage(named: "heart")
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        return heartImage
    }()
    
    let smileImageView: UIImageView = {
        let smileImage = UIImageView()
        smileImage.image = UIImage(named: "smiling")
        smileImage.translatesAutoresizingMaskIntoConstraints = false
        return smileImage
    }()
    
    let likeLabelCount: UILabel = {
        let likeLabel = UILabel()
        likeLabel.textColor = UIColor.darkGray
        likeLabel.font = UIFont.systemFont(ofSize: 14)
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        return likeLabel
    }()
    
    let shareLabelCount: UILabel = {
        let likeLabel = UILabel()
        likeLabel.textColor = UIColor.darkGray
        likeLabel.font = UIFont.systemFont(ofSize: 14)
        likeLabel.textAlignment = .right
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        return likeLabel
    }()
    
    let lineView: UIView = {
       let lineView = UIView()
        lineView.backgroundColor = UIColor(red: 226/255, green: 228/255, blue: 232/255, alpha: 1)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.setTitle(" Like", for: .normal)
        button.setTitleColor(UIColor(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.setTitle(" Comment", for: .normal)
        button.setTitleColor(UIColor(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "share"), for: .normal)
        button.setTitle(" Share", for: .normal)
        button.setTitleColor(UIColor(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    func addSubViewsAndlayout() {
        addSubview(profileImageName)
        addSubview(nameLabel)
        addSubview(statusTextView)
        addSubview(postImage)
        addSubview(smileImageView)
        addSubview(heartImageView)
        addSubview(likeImageView)
        addSubview(likeLabelCount)
        addSubview(shareLabelCount)
        addSubview(lineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        nameLabel.centerYAnchor.constraint(equalTo: self.profileImageName.centerYAnchor, constant: -1).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageName.rightAnchor, constant: 8).isActive = true
        
        profileImageName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        profileImageName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        profileImageName.heightAnchor.constraint(equalToConstant: 48).isActive = true
        profileImageName.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        statusTextView.topAnchor.constraint(equalTo: profileImageName.bottomAnchor, constant: 8).isActive = true
        statusTextView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        statusTextView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        
        postImage.topAnchor.constraint(equalTo: statusTextView.bottomAnchor, constant: 8).isActive = true
        postImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        postImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        likeImageView.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        likeImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        likeImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        likeImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        heartImageView.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        heartImageView.leftAnchor.constraint(equalTo: likeImageView.rightAnchor, constant: -3).isActive = true
        heartImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        heartImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        smileImageView.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        smileImageView.leftAnchor.constraint(equalTo: heartImageView.rightAnchor, constant: -3).isActive = true
        smileImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        smileImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        likeLabelCount.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        likeLabelCount.leftAnchor.constraint(equalTo: smileImageView.rightAnchor, constant: 7).isActive = true
        likeLabelCount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        shareLabelCount.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        shareLabelCount.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        shareLabelCount.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        lineView.topAnchor.constraint(equalTo: likeImageView.bottomAnchor, constant: 10).isActive = true
        lineView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        lineView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.25).isActive = true
        
        likeButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true
        likeButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        commentButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true
        commentButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor).isActive = true
        commentButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        shareButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true
        shareButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor).isActive = true
        shareButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    }
    
   
    
    
}
