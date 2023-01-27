//
//  ShazamButton.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/25/23.
//

import SwiftUI

struct ShazamButton: View {
    @ObservedObject var shazamVM: ShazamViewModel
    
    var body: some View {
        VStack {
            Button {
                shazamVM.shazamButtonPress()
            } label: {
                if shazamVM.isRecordingSound {
                    ShazamButtonPulsing()
                }
                else {
                    ShazamButtonStill()
                }
            }
        }
    }
}

struct ShazamButtonPulsing: View {
    @State private var pulse: CGFloat = 1
    var body: some View {
        Image("shazamKit")
            .shazamIconModifier()
            .scaleEffect(pulse)
            .onAppear{
                withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                    pulse = 1.25 * pulse
                }
            }
            .frame(width: 200, height: 200)
    }
}

struct ShazamButtonStill: View {
    var body: some View {
        Image("shazamKit")
            .shazamIconModifier()
            .frame(width: 200, height: 200)
    }
}

struct ShazamButton_Previews: PreviewProvider {
    static var previews: some View {
        ShazamButton(shazamVM: ShazamViewModel())
    }
}
