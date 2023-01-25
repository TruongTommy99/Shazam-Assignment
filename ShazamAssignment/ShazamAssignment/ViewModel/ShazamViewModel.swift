//
//  ShazamCatalogViewModel.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/24/23.
//
import AVKit
import ShazamKit
import SwiftUI

class ShazamViewModel : NSObject, ObservableObject {
    
    @Published var mediaItems : [SHMediaItem] = []
    
    @Published var isRecordingSound : Bool = false
    
    let session = SHSession()
    
    let engine = AVAudioEngine()
    
    override init() {

      super.init()
        
      session.delegate = self
    }
    
    
    
    
    
}
