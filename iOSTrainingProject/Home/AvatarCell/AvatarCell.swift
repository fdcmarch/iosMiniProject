//
//  AvatarCell.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/18/24.
//

import UIKit

class AvatarCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImageView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.layer.cornerRadius = 12
        backgroundImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 12
        avatarImageView.layer.masksToBounds = true
        
    }

}
