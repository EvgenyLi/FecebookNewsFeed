//
//  FeedCell.swift
//  Facebook News Feed
//
//  Created by Евгений Липадат on 21.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    
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
        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string: "Mark Zuckerberg", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)])
        
        attributedText.append(NSAttributedString(string: "\nApril 20 at 5:17pm · Moscow · ", attributes:
            [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.lightGray]))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedText.string.count))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "globe_small")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageName: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "mark")
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let statusTextView: UILabel = {
        let textView = UILabel()
        textView.text = "In an hour I’m going to testify in front of the Senate about how Facebook needs to take a broader view of our responsibility."
        textView.lineBreakMode = .byWordWrapping
        textView.numberOfLines = 0
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "post_mark")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    
    func addSubViewsAndlayout() {
        addSubview(profileImageName)
        addSubview(nameLabel)
        addSubview(statusTextView)
        addSubview(postImage)
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
        
    }
    
    
}
