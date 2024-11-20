//
//  TeachersProfileComponent.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/19/24.
//

import SwiftUI

struct TeachersProfileComponent: View {
    var body: some View {
        Text("Hello, Love, Again")
    }
}
extension Image {
    func iconBiggerSize() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
    }
}
struct TeachersProfileHeaderView: View {
    var body: some View {
        HStack {
            Image("panda")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
            
            Image("blue")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 15, height: 15)
            
            Text("Miki")
                .font(.system(size: 20))
                .foregroundStyle(.white)
            
            Text("(Age: 64)")
                .font(.system(size: 15))
                .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 10)
    }
}


struct TutorsProfileIntroductionView: View {
    
    var body: some View {
        VStack (alignment: .leading){
            VStack(alignment: . leading){
                Text("Introduction")
                    .font(.system(size: 23))
                    .bold()
                Text("This is a sample introduction")
                
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Text("Display translation")
                            .foregroundStyle(.blue)
                        Image(systemName: "arrowtriangle.down.fill")
                    })
                }
            }
            .padding(.bottom, 20)
            
            VStack(alignment: . leading){
                Text("Coins consumed")
                    .font(.system(size: 23))
                    .bold()
                Text("Sudden Lesson: No coins required")
                Text("Booked Lesson: 100 coins")
            }
            .padding(.bottom, 20)
            
            VStack(alignment: . leading){
                Text("Features")
                    .font(.system(size: 23))
                    .bold()
                HStack {
                    Text("Suitable for kids")
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(20)
                    Text("Goodboy")
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(20)
                }
            }
            .padding(.bottom, 20)
            
            VStack(alignment: . leading){
                Text("Hobbies")
                    .font(.system(size: 23))
                    .bold()
                HStack {
                    Text("Singing")
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(20)
                    Text("Music")
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(20)
                }
            }
            
            VStack(alignment: . leading){
                Text("Career")
                    .font(.system(size: 23))
                    .bold()
                Text("No work experience")
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.white)
    
    }
}
struct GenerationChoosingThisInstructorView: View {
    let generationLabel: String
    let percentage: Double
    
    var body: some View {
        HStack {
            Text(generationLabel)
                .frame(maxWidth: 50, alignment: .leading)
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 20)
                    .foregroundColor(Color.gray.opacity(0.3))
                Rectangle()
                    .frame(width: CGFloat(percentage) * 2, height: 20)
                    .foregroundColor(Color.white)
            }
            Text(String(format: "%.1f%%", percentage))
                .frame(maxWidth: 60)
        }
    }
}

struct GalleyImageView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .font(.system(size: 23))
                .bold()
            
            GeometryReader { geometry in
                VStack {
                    HStack(spacing: 8) {
                        ForEach(0..<3) { _ in
                            Image("chung")
                                .resizable()
                                .frame(width: (geometry.size.width - 16) / 3, height: 170)
                                .cornerRadius(8)
                        }
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Text("See More")
                                .foregroundColor(.blue)
                                .font(.system(size: 16))
                        })
                    }
                }
            }
            .frame(height: 200)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.white)
    }
}

struct RecommendedTutorsView:View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended tutors")
                .font(.system(size: 23))
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(0..<5) { _ in
                        VStack(alignment: .leading) {
                            Image("chung")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .background(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            
                            Text("Kou Ya")
                                .font(.headline)
                                .foregroundColor(.white)
                                .lineLimit(1)
                            
                            
                            HStack {
                                Image("phil")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                Text("Philippines")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            
                            
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                Text("5.0")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            
                            
                            HStack(spacing: 4) {
                                Image(systemName: "text.bubble.fill")
                                    .foregroundColor(.white)
                                Text("107 times")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            
                            
                            HStack(spacing: 4) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.white)
                                Text("51 people")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(6)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(12)
                    }
                }
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.white)
    }
}
#Preview {
    RecommendedTutorsView()
}
