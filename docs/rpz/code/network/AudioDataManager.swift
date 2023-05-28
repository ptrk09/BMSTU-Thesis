protocol AudioDataManager {
    var numberOfQueued: Int { get }
    var allowCellular: Bool { get set }
    
    func setHTTPHeaderFields(_ fields: [String: String]?)
    func setDownloadDirectory(_ dir: FileManager.SearchPathDirectory)
    func attach(callback: @escaping (_ id: ID, _ progress: Double)->())

    func startStream(withRemoteURL url: AudioURL, callback: @escaping (StreamProgressPTO) -> ())
    func pauseStream(withRemoteURL url: AudioURL)
    func resumeStream(withRemoteURL url: AudioURL)
    func seekStream(withRemoteURL url: AudioURL, toByteOffset offset: UInt64)
    func deleteStream(withRemoteURL url: AudioURL)
}