protocol AudioParser {
    var fileAudioFormat: AVAudioFormat? { get }
    var totalPredictedPacketCount: AVAudioPacketCount { get }
    var totalPredictedAudioFrameCount: AUAudioFrameCount?
    var predictedDuration: Duration?
    
    func pollRangeOfSecondsAvailableFromNetwork() -> (Needle, Duration)
    func pullPacket(atIndex index: AVAudioPacketCount) throws -> (AudioStreamPacketDescription?, Data)
    func invalidate()
}
