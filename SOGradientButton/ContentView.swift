//
//  ContentView.swift
//  SOGradientButton
//
//  Created by Wl Alili on 2021/8/9.
//

import SwiftUI

struct ContentView: View {
    var brandGradient = Gradient(colors: [Color(.systemTeal), Color(.systemPurple)])
    var body: some View {
        VStack(spacing: 60){
            SOGradientButton(title: "Linear Gradient", brandGradient: brandGradient, size: CGSize(width: 280, height: 50), start: .leading, end: .trailing, backgroundType: .linear, foregroundColor: .white)
            SOGradientButton(title: "Linear Border Gradient", brandGradient: brandGradient, size: CGSize(width: 280, height: 50), start: .leading, end: .trailing, backgroundType: .clear, foregroundColor: .black, borderWidth: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SOGradientButton: View {
    let title: String
    let brandGradient: Gradient
    let size: CGSize
    let start: UnitPoint
    let end: UnitPoint
    let backgroundType: SOGradientBackGroundType
    let foregroundColor: Color?
    var borderWidth: CGFloat? = 0
    var body: some View {
        Button {
            print("Linear Gradient Button Tapped")
        } label: {
            switch backgroundType {
            case .linear:
                Text(title)
                    .bold()
                    .frame(width: size.width, height: size.height)
                    .foregroundColor(foregroundColor)
                    .background(LinearGradient(gradient: brandGradient, startPoint: start, endPoint: end))
                    .clipShape(Capsule())
            case .clear:
                Text(title)
                    .bold()
                    .frame(width: size.width, height: size.height)
                    .foregroundColor(foregroundColor)
                    .background(Color.clear)
                    .overlay(Capsule().stroke(LinearGradient(gradient: brandGradient, startPoint: .leading, endPoint: .trailing), lineWidth: borderWidth!))
            }
            
        }
    }
}

enum SOGradientBackGroundType {
    case linear
    case clear
}
