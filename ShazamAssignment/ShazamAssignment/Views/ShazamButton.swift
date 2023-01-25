//
//  ShazamButton.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/25/23.
//

import SwiftUI

struct ShazamButton: View {
    
    @ObservedObject var shazamViewModel : ShazamViewModel
    
    @State var size : Double = 60.0
    
    var body: some View {
        
        ZStack {
            
            Button {
                shazamViewModel.shazamButton()
            } label: {
                Image("shazamIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width:size, height: size)
                
            }
            .scaleEffect(shazamViewModel.isRecordingSound ? 1.0 : 0.8)
            .animation(.easeInOut)
            
        }
        
    }
}

struct ShazamButton_Previews: PreviewProvider {
    static var previews: some View {
        ShazamButton(shazamViewModel: ShazamViewModel())
    }
}
