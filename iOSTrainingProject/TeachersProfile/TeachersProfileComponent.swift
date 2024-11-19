//
//  TeachersProfileComponent.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/19/24.
//

import SwiftUI

struct TeachersProfileComponent: View {
    var body: some View {
        HStack {
                   // Progress Bar
                   ZStack(alignment: .leading) {
                       // Background Bar
                       Rectangle()
                           .frame(height: 20)
                           .foregroundColor(Color.gray.opacity(0.3))
                           .cornerRadius(10)

                       // Filled Progress Bar
                       Rectangle()
                           .frame(width: 20, height: 20) // 66.67% fill
                           .foregroundColor(.blue)
                           .cornerRadius(10)
                   }
                   .frame(width: 200) // Total width of the progress bar

                   // Static Percentage Label
                   Text("66.67%")
                       .font(.system(size: 16))
                       .foregroundColor(.red)
               }
               .padding()
    }
}
extension Image {
    func iconBiggerSize() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
    }
}
struct TeachersProfileHeader: View {
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


struct TutorsProfileIntroduction: View {
    
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
struct GenerationPercent: View {
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
                    .foregroundColor(Color.blue)
            }
            Text(String(format: "%.1f%%", percentage))
                .frame(maxWidth: 60)
        }
    }
}

#Preview {
    TutorsProfileIntroduction()
}
