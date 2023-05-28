var predictedDuration: Duration? {
    guard let sampleRate = fileAudioFormat?.sampleRate else {
        return nil
    }

    guard 
        let totalPredictedFrameCount = totalPredictedAudioFrameCount 
    else { 
        return nil 
    }

    return Duration(totalPredictedFrameCount)/Duration(sampleRate)
}

var totalPredictedAudioFrameCount: AUAudioFrameCount? {
    let framesPerPacket = fileAudioFormat?.streamDescription.pointee.mFramesPerPacket
    guard let framesPerPacket = framesPerPacket else {
        return nil
    }

    return AVAudioFrameCount(totalPredictedPacketCount) * AVAudioFrameCount(framesPerPacket)
}