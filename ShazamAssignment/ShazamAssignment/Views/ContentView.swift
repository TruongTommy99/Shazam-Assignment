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
                Text( shazamViewModel.isRecordingSound ? "Tap to stop Shazaming" :
                    "\(Image(systemName: "mic"))  Tap to Shazam!"
                      )
                    .bold()
                    .font(.title)
                    .foregroundColor(.blue)
                    .animation(.easeInOut)
                
                ShazamButton(shazamVM: shazamViewModel)
                
                if (shazamViewModel.mediaItems.count > 0) {
                    MusicInformationView(mediaItem: $shazamViewModel.latestMediaItem)
                    .padding()
                    .onAppear {
                        withAnimation {
                        }
                    }
                }
                if (shazamViewModel.mediaItems.count == 0) {
                   Text("No music yet")
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
