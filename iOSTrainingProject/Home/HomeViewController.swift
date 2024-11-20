//
//  HomeViewController.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/18/24.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {

    @IBOutlet weak var ratingOrderButtonLabel: UIButton!
    @IBOutlet weak var avatarCollectionView: UICollectionView!
    @IBOutlet weak var teachersTableView: UITableView!
    
    private let teachers : [Teacher] = [
        Teacher(imageName: "chung", name: "Chung Myung", status: "0", address: "Luzon", rating: "5.00", lesson: "500", coin: "500", flag: "phil", country: "Pilipinas", tag: "buotan", imageGallery: ["panda", "taylor", "chung", "maja", "taylor", "panda", "sjw", "mikha", "taylor", "chung", "panda", "taylor", "chung", "maja", "sjw", "mikha", "taylor", "chung"]),
            Teacher(imageName: "panda", name: "Mikha", status: "1", address: "Visayas", rating: "4.00", lesson: "700", coin: "500", flag: "phil", country: "Pilipinas", tag: "buotan", imageGallery: ["panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja"]),
            Teacher(imageName: "gonpachiro", name: "Taylor", status: "1", address: "Cebu", rating: "4.00", lesson: "100", coin: "700", flag: "phil", country: "Pilipinas", tag: "buotan", imageGallery: ["panda", "taylor", "gonpachiro", "panda", "taylor"]),
            Teacher(imageName: "chung", name: "Sung Jin-woo", status: "0", address: "Bohol", rating: "5.00", lesson: "200", coin: "700", flag: "usa", country: "America", tag: "buotan", imageGallery: ["gonpachiro", "panda", "taylor", "panda", "taylor"]),
            Teacher(imageName: "gonpachiro", name: "Tanjiro", status: "0", address: "Japan", rating: "5.00", lesson: "100", coin: "100", flag: "phil", country: "Skina Kamputhaw", tag: "buotan", imageGallery: ["panda", "taylor"]),
            Teacher(imageName: "gonpachiro", name: "Traaaaining??", status: "0", address: "Tokyo", rating: "5.00", lesson: "9900", coin: "2000", flag: "usa", country: "Skina Japan", tag: "buotan", imageGallery: ["panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja"]),
            Teacher(imageName: "panda", name: "Pandaman", status: "1", address: "Lahug", rating: "5.00", lesson: "5000", coin: "2000", flag: "usa", country: "IT Park", tag: "buotan", imageGallery: ["panda", "taylor", "sjw", "gonpachiro", "maja", "panda"])
    
    ]
    
    private let avatars : [Avatar] = [
        Avatar(imageName: "bear", name: "Bear"),
        Avatar(imageName: "panda", name: "panda"),
        Avatar(imageName: "mouse", name: "mouse"),
        Avatar(imageName: "monkey", name: "monkey"),
        Avatar(imageName: "lion", name: "lion")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        let nib = UINib(nibName: "TeacherCell", bundle: nil)
        teachersTableView.register(nib, forCellReuseIdentifier: "TeacherCell")
        
        let nib2 = UINib(nibName: "AvatarCell", bundle: nil)
        avatarCollectionView.register(nib2, forCellWithReuseIdentifier: "AvatarCell")
        
        //design2x
        ratingOrderButtonLabel.layer.cornerRadius = 20
        ratingOrderButtonLabel.layer.masksToBounds = true
    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as? TeacherCell {
            
            let teacher = teachers[indexPath.row]
            cell.teacherName.text = teacher.name
            cell.teacherAddress.text = teacher.address
            cell.teacherRating.text = teacher.rating
            cell.teacherLesson.text = teacher.lesson
            cell.teacherCoin.text = teacher.coin
            cell.teacherImage.image = UIImage(named: teacher.imageName)
            cell.teacherFlag.image = UIImage(named: teacher.flag!)
            cell.teacherTag.text = teacher.tag
            if teacher.status == "1" {
                cell.teacherStatus.image = UIImage(named: "active")
            } else {
                cell.teacherStatus.image = UIImage(named: "offline")
            }
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTeacher = teachers[indexPath.row]
        let swiftUIView = TeachersProfileView(teacher: selectedTeacher)
        let hostingController = UIHostingController(rootView: swiftUIView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
}
extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 254.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 15, left: 5, bottom: 10, right: 0)
    }
}
