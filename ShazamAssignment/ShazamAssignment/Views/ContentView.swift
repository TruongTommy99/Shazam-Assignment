//
//  ContentView.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/22/23.
//

import SwiftUI
import ShazamKit

struct ContentView: View {
    
    @StateObject var shazamViewModel = ShazamViewModel()
    
    var body: some View {
            VStack {
                
                if let _ = shazamViewModel.latestMediaItem{
                    MusicInformationView(mediaItem: $shazamViewModel.latestMediaItem)
                    .padding()
                    .onAppear {
                        withAnimation() {}
                    }
                }
                
                VStack {
                    ShazamButton(shazamVM: shazamViewModel)
                    
                    Text( shazamViewModel.isRecordingSound ? "Tap to stop Shazaming" :
                        "Tap to Shazam!")
                        .bold()
                        .font(.title)
                        .foregroundColor(.blue)
                        .animation(.easeInOut)
                }
                .onChange(of: shazamViewModel.latestMediaItem) { _ in
                    withAnimation() {}
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
