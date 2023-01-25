//
//  ContentView.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var shazamViewModel = ShazamViewModel()
    
    var body: some View {
        
        VStack {
            
            ShazamButton(shazamViewModel: shazamViewModel)
            
            List  {
                ForEach(shazamViewModel.mediaItems,id: \.self) { mediaItem in
                    MusicInformationView(mediaItem: mediaItem)
                        .frame(width: 100,height:100)
                        .padding()
                }
                
            
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
