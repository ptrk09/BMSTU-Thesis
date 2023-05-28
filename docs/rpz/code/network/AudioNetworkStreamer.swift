protocol AudioNetworkStreamer {
    var HTTPHeaderFields: [String: String]? { get set }
    func start(withID id: ID, withRemoteURL url: URL, withInitialData data: Data?, andTotalBytesExpectedPreviously previousTotalBytesExpected: Int64?)
    func pause(withId id: ID)
    func resume(withId id: ID)
    func stop(withId id: ID)
    func seek(withId id: ID, withByteOffset offset: UInt64)
}
