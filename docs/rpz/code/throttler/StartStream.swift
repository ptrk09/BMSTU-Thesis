func handlerStream(withRemoteUrl url: AudioURL) {
    AudioDataManager.shared.startStream(withRemoteURL: url) { [weak self] pto in
        guard let self = self else { return }
        if let totalBytesExpected = pto.getTotalBytesExpected() {
            self.totalBytesExpected = totalBytesExpected
        }

        self.queue.async { [weak self] in
            guard isAvailablePull(pto) else { return }
            self?.networkData.append(pto.getData())
            StreamingDownloadDirector.shared.didUpdate(url.key, networkStreamProgress: pto.getProgress())
        }
    }
}