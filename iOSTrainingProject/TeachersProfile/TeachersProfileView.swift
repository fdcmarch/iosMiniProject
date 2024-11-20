//
//  TeachersProfileView.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/19/24.
//

import SwiftUI

struct TeachersProfileView: View {
    @State var selectedTab = 0
    var teacher: Teacher? = nil
    
    let generations = [
        GenerationChoosingThisInstructorView(generationLabel: "Up to 9 years old", percentage: 1.9),
        GenerationChoosingThisInstructorView(generationLabel: "Teens", percentage: 10.48),
        GenerationChoosingThisInstructorView(generationLabel: "20s", percentage: 24.27),
        GenerationChoosingThisInstructorView(generationLabel: "30s", percentage: 3.64),
        GenerationChoosingThisInstructorView(generationLabel: "40s", percentage: 4.17),
        GenerationChoosingThisInstructorView(generationLabel: "50s", percentage: 56.5),
        GenerationChoosingThisInstructorView(generationLabel: "60s", percentage: 0.95)
        ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                TeachersProfileHeaderView()
                //start: body
                HStack {
                    Image("panda")
                        .resizable()
                        .frame(width: 200, height: 350)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image("japan")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Japan")
                        }
                        HStack {
                            Image(systemName: "person.text.rectangle")
                            Text("13 years 7 months")
                        }
                        HStack {
                            Image(systemName: "star.fill")
                            Text("5.00")
                        }
                        HStack {
                            Image(systemName: "figure.child")
                            Text("5.00")
                        }
                        HStack {
                            Image(systemName: "book.fill")
                            Text("550 times")
                        }
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("63 people")
                        }
                        HStack {
                            Image(systemName: "clock.fill")
                            Text("2024-11-17 (Sun)")
                        }
                        
//                        VStack(alignment: .leading) {
//                            HStack{
//                                Image("image1")
//                                    .iconBiggerSize()
//                                Text("Good explaination")
//                            }
//                            HStack{
//                                Image("image2")
//                                    .iconBiggerSize()
//                                Text("Good at grammar")
//                            }
//                            HStack{
//                                Image("image3")
//                                    .iconBiggerSize()
//                                Text("Friendly")
//                            }
//                        }
//                        .padding(.top, 20)
                    }
                    .font(.system(size: 17))
                    .foregroundStyle(.white)
                }
                VStack{
                    Button(
                        action: {
                        }, label: {
                            HStack(spacing: 1){
                                Spacer()
                                Image(systemName: "clock")
                                    .tint(.white)
                                Text("Proceed to sudden lesson")
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .frame(height: 35)
                                Spacer()
                            }
                            .padding(10)
                            .background(.blue.opacity(0.8))
                        })
                    
                    Button(
                        action: {
                        }, label: {
                            HStack(spacing: 1){
                                Spacer()
                                Image(systemName: "note.text")
                                    .tint(.black)
                                Text("Book Lesson")
                                    .foregroundStyle(.black)
                                    .padding(10)
                                    .frame(height: 35)
                                Spacer()
                            }
                            .padding(10)
                            .background(.white)
                        })
                    
                }
                HStack(spacing: 42){
                    VStack{
                        Image(systemName: "heart.fill")
                        Text("Favorite")
                    }
                    VStack{
                        Image(systemName: "arrow.clockwise")
                        Text("Refresh")
                    }
                    VStack{
                        Image(systemName: "paperplane")
                        Text("Share")
                    }
                    VStack{
                        Image(systemName: "note.text")
                        Text("Keep")
                    }
                }
                .foregroundStyle(.white)
                //end: body
                
                //start:  3 tab
                HStack {
                    Button(action: {
                        selectedTab = 0
                    }, label: {
                        VStack {
                            Text("Tutor's Profile")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .bold))
                            Rectangle()
                                .fill(.orange)
                                .frame(height: 2)
                        }
                        .frame(maxWidth: .infinity)
                    })
                    
                    Button(action: {
                        selectedTab = 1
                    }, label: {
                        VStack {
                            Text("Lesson Detail")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .bold))
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 2)
                        }
                        .frame(maxWidth: .infinity)
                    })
                   
                    Button(action: {
                        selectedTab = 2
                    }, label: {
                        VStack {
                            Text("Reviews")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .bold))
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 2)
                        }
                        .frame(maxWidth: .infinity)
                    })
                }
                
                    TutorsProfileIntroductionView()
                
                    VStack(alignment: .leading) {
                        Text("Generation choosing this instructor")
                            .font(.system(size: 23))
                            .bold()
                        ForEach(generations, id: \.generationLabel) { generation in
                            GenerationChoosingThisInstructorView(generationLabel: generation.generationLabel, percentage: generation.percentage)
                        }
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.white)
                
                    GalleyImageView()
                    RecommendedTutorsView()
                //end: 3 tab
            }
            
        }
        .background(.black)
    }
}

#Preview {
    TeachersProfileView()
}
