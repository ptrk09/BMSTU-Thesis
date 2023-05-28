protocol AudioThrottler {
    func pullNextDataPacket(_ callback: @escaping (Data?) -> ())
    func tellSeek(offset: UInt64)
    func pollRangeOfBytesAvailable() -> (UInt64, UInt64)
    func invalidate()
}
