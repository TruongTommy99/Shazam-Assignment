//
//  ShazamCatalogViewModel + ShazamDelegate.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/24/23.
//

import AVKit
import ShazamKit
import SwiftUI

extension ShazamViewModel : SHSessionDelegate {
    public func shazamButtonPress() {
        do {
          if engine.isRunning {
            try stopRecording()
            return
          }
          
          try prepareAudioRecording()
          generateSignature()
          try startRecording()

        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func generateSignature() {
      let inputNode = engine.inputNode
        
      let recordingFormat = inputNode.outputFormat(forBus: .zero)
      
      inputNode.installTap(onBus: .zero,
                           bufferSize: 1024,
                           format: recordingFormat) { [weak session] buffer, _ in
          
        session?.matchStreamingBuffer(buffer, at: nil)
          
      }
    }
    
    func session(_ session: SHSession, didFind match: SHMatch) {
        guard let mediaItem = match.mediaItems.first else { return }
        
        print("WE GET \(mediaItem.title!)")

        /// Verify if the item is already in the list or not. If it already is, we simply ignore it.
        if mediaItems.contains(where: { item in
            item.shazamID == mediaItem.shazamID
        }) {
            /// Simply skip to the next step
        }
        
        /// If it isn't, we can proceed to add in the array.
        else {
            DispatchQueue.main.async {
                self.mediaItems.append(mediaItem)
                self.latestMediaItem = mediaItem
            }
        }
    }
}
