func start(withID id: ID, withRemoteURL url: URL, withInitialData data: Data? = nil, andTotalBytesExpectedPreviously previousTotalBytesExpected: Int64? = nil) {
    killPreviousTaskIfNeeded()
    guard let data = data else {
        var request = URLRequest(url: url)
        HTTPHeaderFields?.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        task = session.dataTask(with: request)
        task?.taskDescription = id
        return task?.resume()
    }
    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: TIMEOUT)
    HTTPHeaderFields?.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    request.addValue("bytes=\(data.count)-", forHTTPHeaderField: "Range")
    task = session.dataTask(with: request); task?.taskDescription = id
    initialDataBytesCount = Int64(data.count)
    totalBytesExpectedForWholeFile = previousTotalBytesExpected
    let progress = previousTotalBytesExpected != nil ? Double(initialDataBytesCount)/Double(previousTotalBytesExpected!) : 0
    let dto = StreamProgressDTO(progress: progress, data: data, totalBytesExpected: totalBytesExpectedForWholeFile)
    progressCallback(id, dto); task?.resume()
}