//
//  MusicInformationView.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/24/23.
//

import SwiftUI
import ShazamKit

struct MusicInformationView: View {
    
    @State var mediaItem: SHMediaItem
    
    var body: some View {
        
        VStack {
            
            if let mediaItemUrl = mediaItem.artworkURL {
                
                AsyncImage(url: mediaItemUrl,
                           transaction: .init(animation: .default)) { phase in
                    phase.image?
                        .resizable()
                        .scaledToFit()
                    }
            }
            
            else {
                ProgressView()
            }
            
            Text(mediaItem.title ?? "No song")
            
            Text(mediaItem.artist ?? "No artist")
        }
    }
}

struct MusicInformationView_Previews: PreviewProvider {
    static var previews: some View {
        MusicInformationView(mediaItem: SHMediaItem(properties: [ : ]))
    }
}
