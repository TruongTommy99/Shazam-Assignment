//
//  MusicInformationView.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/24/23.
//

import SwiftUI
import ShazamKit

struct MusicInformationView: View {
    
    @Binding var mediaItem: SHMediaItem?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4.0) {
            
            if let mediaItemUrl = mediaItem?.artworkURL {
                AsyncImage(url: mediaItemUrl,
                           transaction: .init(animation: .default)) { phase in
                    phase.image?
                        .resizable()
                        .scaledToFit()
                }
                
                Text(mediaItem?.title ?? "No title")
                    .fontWeight(.bold)
                    .font(.system(size: 28, weight: .heavy, design: .default))
                    
                Text(mediaItem?.artist ?? "No artist")
                    .fontWeight(.medium)
                    .font(.body)
                
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
