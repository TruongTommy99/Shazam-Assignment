//
//  ShazamViewModel + AudioProcessing.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/24/23.
//

import AVKit
import ShazamKit
import SwiftUI

extension ShazamViewModel {
    
    func prepareAudioRecording() throws {
        
        let audioSession = AVAudioSession.sharedInstance()
        audioSession.requestRecordPermission { [weak self] success in
            guard success, self == self else { return }
        }
        try audioSession.setCategory(.record)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
    }
    
    func startRecording() throws {
        engine.prepare()
        try engine.start()
        isRecordingSound = true
    }
    
    func stopRecording() throws {
        engine.stop()
        engine.inputNode.removeTap(onBus: .zero)
        isRecordingSound = false
    }
    
}
