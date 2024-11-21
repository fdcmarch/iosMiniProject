//
//  ViewController.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/18/24.
//

import UIKit
import SwiftUI
class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var teachersTableView: UITableView!
    @IBOutlet weak var ratingOrderButtonLabel: UIButton!
    @IBOutlet weak var avatarCollectionView: UICollectionView!
    private var teachers: [Teacher] = []
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
        
        fetchTeachers()
        
        
    }
    func fetchTeachers() {
        NetworkManager.shared.getAllTeachers { [weak self] teachersResponse in
            guard let self = self else { return }
            guard let teachersResponse = teachersResponse else {
                print("No teachers available")
                return
            }
            
            // Extract teachers array from TeachersResponse
            self.teachers = teachersResponse.teachers
            print(teachers)
            // Reload table view
            DispatchQueue.main.async {
                self.teachersTableView.reloadData()
            }
        }
    }




}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Limiting the number of rows to 4
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(4, teachers.count)
//        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Ensure the cell is of the correct type
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as? TeacherCell {
            // Safely access the teacher, ensuring we don't go out of bounds
            let teacher = teachers[indexPath.row]
            cell.teacherName.text = teacher.nameEng
            return cell
        }
        return UITableViewCell()  // Return an empty cell if something goes wrong
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Ensure we're not accessing out of bounds
        if indexPath.row < teachers.count {
            let selectedTeacher = teachers[indexPath.row]
            let swiftUIView = TeachersProfileView(teacher: selectedTeacher)
            let hostingController = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(hostingController, animated: true)
        }
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
           return CGSize(width: 50, height: 254.5)
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
