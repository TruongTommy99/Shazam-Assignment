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
                           format: recordingFormat) {  buffer, _ in
          self.session.matchStreamingBuffer(buffer, at: nil)
      }
    }
    
    func session(_ session: SHSession, didFind match: SHMatch) {
        
        guard let mediaItem = match.mediaItems.first else { return }

            DispatchQueue.main.async {
                self.latestMediaItem = mediaItem
            }
    }
}
