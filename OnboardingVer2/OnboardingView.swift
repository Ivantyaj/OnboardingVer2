//
//  OnboardingView.swift
//  OnboardingVer2
//
//  Created by Macintosh on 6/26/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    var image: String
    var header: String
    var description: String
    
    var body: some View {
        VStack{
            VStack{
                Image(image)
                    .resizable()
                    .padding(.all)
                    .frame(height: 400.0)
                
                
                Text(header)
                    .font(.system(size: 25, weight:.bold, design: .rounded))
                    .padding(.bottom, 20)
                Text(description)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(image: "P1", header: "Keep an eye", description: "Какое-то там описание нашей чудесной фичи, лучше которй ниче и нет")
    }
}
