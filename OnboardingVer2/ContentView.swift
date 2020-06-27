//
//  ContentView.swift
//  OnboardingVer2
//
//  Created by Macintosh on 6/26/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var SlideGesture = CGSize.zero
    @State var SlideOne = false
    @State var SlideOnePrevious = false
    @State var SlideTwo = false
    @State var SlideTwoPrevious = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            
            OnboardingView(image: "P3", header: "ШБ?", description: "ШБ!")
                .offset(x: SlideGesture.width)
                .offset(x: SlideTwo ? 0 : 500)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width > 150 {
                            self.SlideTwo = false
                            self.SlideTwoPrevious = true
                        }
                        self.SlideGesture = .zero
                    }
            )

            OnboardingView(image: "P2", header: "Прокачка глаз", description: "Прокачаем. Закачаем. Выкачаем. И вообще")
                .offset(x: SlideGesture.width)
                .offset(x: SlideOne ? 0 : 500)
                .offset(x: SlideOnePrevious ? 500 : 0)
                .offset(x: SlideTwo ? -500 : 0)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded{ value in
                        if self.SlideGesture.width < -150 {
                            self.SlideOne = true
                            self.SlideTwo = true
                           
                        }
                        
                        if self.SlideGesture.width > 150 {
                            self.SlideOnePrevious = true
                            self.SlideOne = false
                            
                        }
                        self.SlideGesture = .zero
                    }
            )
            
            OnboardingView(image: "P1", header: "Keep an eye", description: "Какое-то там описание нашей чудесной фичи, лучше которй ниче и нет")
                .offset(x: SlideGesture.width)
                .offset(x: SlideOne ? -500 : 0)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded{ value in
                        if self.SlideGesture.width < -150 {
                            self.SlideOne = true
                            self.SlideOnePrevious = false
                        }
                        self.SlideGesture = .zero
                    }
            )
            
            VStack {
                Spacer()
                ZStack{
                    VStack{
                        Text("Начинаем!")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 140.0, height: 40.0)
                    .background(Color.black)
                    .cornerRadius(20)
                    
                    VStack{
                        Text("Пропустить")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 140.0, height: 40.0)
                    .background(Color.black)
                    .cornerRadius(20)
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
