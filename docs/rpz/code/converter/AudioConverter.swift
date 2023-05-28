protocol AudioConverter {
    var engineAudioFormat: AVAudioFormat { get }
    
    func pullBuffer() throws -> AVAudioPCMBuffer
    func pollPredictedDuration() -> Duration?
    func pollNetworkAudioAvailabilityRange() -> (Needle, Duration)
    func seek(_ needle: Needle)
    func invalidate()
}