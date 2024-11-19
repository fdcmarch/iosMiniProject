//
//  Teacher.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/18/24.
//

import Foundation
struct Teacher {
    let id: UUID = UUID()
    let imageName: String
    let name: String
    let status: String
    let address: String
    let rating: String
    let lesson: String
    let coin: String
    let flag: String?
    let country: String
    let tag: String
    var imageGallery: [String]
}
