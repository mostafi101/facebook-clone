//
//  FeedCell.swift
//  FaceBookClone
//
//  Created by Mostafijur Rahaman on 5/20/17.
//  Copyright © 2017 Mostafijur Rahaman. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var post: Post? {
        didSet {
            if let name = post?.name {
                let attributedText = NSMutableAttributedString(string: "\(name)", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
                
                attributedText.append(NSAttributedString(string: "\nMay 19  •  Pasadena  •  ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.rgb(red: 155, green: 161, blue: 171)]))
                
                let paragrapgStyle = NSMutableParagraphStyle()
                paragrapgStyle.lineSpacing = 4
                
                attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragrapgStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "globe_small")
                attachment.bounds = CGRect(x:0, y:-2,width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attachment))
                
                nameLabel.attributedText = attributedText
                
                
            }
            
            // set ststus text
            
            
            if let statusText = post?.statusText {
                statusTextView.text = statusText
                
            }
            
            if let profileImage = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImage)
            }
            
            if let statusImage = post?.statusImageName {
                statusImageView.image = UIImage(named: statusImage)
            }
            
            if let numOfLikes = post?.numOfLikes , let numOfComments = post?.numOfComments{
                likeComentsLabel.text = "\(numOfLikes) Likes    \(numOfComments) Comments"
            }
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        
        //label.text = "Sample Name"
        //label.font = UIFont.boldSystemFont(ofSize: 14)
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let likeComentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    
    
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fillEqually
        stack.spacing = 8
        
        let likeButton: UIButton = FeedCell.buttonFroTitle(title: "Like", imageName: "like")
        let commentButton: UIButton = FeedCell.buttonFroTitle(title: "Comment", imageName: "comment")
        let shareButton: UIButton = FeedCell.buttonFroTitle(title: "Share", imageName: "share")
        
        stack.addArrangedSubview(likeButton)
        stack.addArrangedSubview(commentButton)
        stack.addArrangedSubview(shareButton)
        return stack
    }()
    
    static func buttonFroTitle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
        
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likeComentsLabel)
        addSubview(dividerLineView)
        addSubview(stackView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        addConstraintsWithFormat(format: "H:|-12-[v0]|", views: likeComentsLabel)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: stackView)
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)]-8-[v5(16)]-8-|", views: profileImageView, statusTextView, statusImageView, likeComentsLabel, dividerLineView, stackView)
        
        /*addConstraints(NSLayoutConstraint.constraints(withVisualFormat : "H:|-8-[v0(44)]-8-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : profileImageView, "v1" : nameLabel]))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(44)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : profileImageView]))*/
        
    }
}
