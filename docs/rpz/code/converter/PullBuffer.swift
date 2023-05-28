func pullBuffer() throws -> AVAudioPCMBuffer {
    guard let converter = converter else {
        throw ConverterError.cannotCreatePCMBufferWithoutConverter
    }
    let pcmBuffer = AVAudioPCMBuffer(pcmFormat: engineAudioFormat, frameCapacity: pcmBufferSize)
    pcmBuffer.frameLength = pcmBufferSize
    return try queue.sync { _ in
        let framesPerPacket = engineAudioFormat.streamDescription.mFramesPerPacket
        var countPacketsForBufferToFill = pcmBuffer.frameLength / framesPerPacket
        let context = unsafeBitCast(self, to: UnsafeMutableRawPointer.self)
        let status = AudioConverterFillComplexBuffer(converter, ConverterListener, context, &countPacketsForBufferToFill, pcmBuffer.mutableAudioBufferList, nil)
        guard status == noErr else { throw status.error }
        return pcmBuffer
    }
}