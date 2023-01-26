//
//  MusicInformationView.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/24/23.
//

import SwiftUI
import ShazamKit

struct MusicInformationView: View {
    
    @Binding var mediaItem: SHMediaItem
    
    var body: some View {
        
        VStack {
            
            if let mediaItemUrl = mediaItem.artworkURL {
                AsyncImage(url: mediaItemUrl,
                           transaction: .init(animation: .default)) { phase in
                    phase.image?
                        .resizable()
                        .scaledToFit()
                }
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(mediaItem.title ?? "No song")
                        .fontWeight(.bold)
                        .font(.system(size: 36, weight: .heavy, design: .rounded))
                    
                    Text(mediaItem.artist ?? "No artist")
                        .fontWeight(.light)
                        .font(.caption)
                }
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            }
            
            else {
            }
        }
    }
}

//struct MusicInformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        MusicInformationView(mediaItem: SHMediaItem(properties: [ : ]))
//    }
//}
