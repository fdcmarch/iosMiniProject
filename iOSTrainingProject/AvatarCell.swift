//
//  AvatarCell.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/21/24.
//

import UIKit

class AvatarCell: UICollectionViewCell {

    @IBOutlet weak var avatarTeacherMainBgView: UIView!
        @IBOutlet weak var backgroundImageView: UIView!
        @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // design2x
        backgroundImageView.layer.cornerRadius = 10
        backgroundImageView.layer.shadowColor = UIColor.white.cgColor
        backgroundImageView.layer.shadowOpacity = 0.5
        backgroundImageView.layer.shadowRadius = 8
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.layer.masksToBounds = true
        avatarTeacherMainBgView.layer.cornerRadius = 10
        avatarTeacherMainBgView.layer.masksToBounds = true
    }
}
