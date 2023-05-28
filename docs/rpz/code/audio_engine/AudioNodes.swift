func initAudioNodes(engine: AVAudioEngine, _ format: AVAudioFormat) {
    engine.attach(playerNode)
    audioModifiers = SAPlayer.shared.audioModifiers
    defer { engine.prepare() }
    guard let audioModifiers, audioModifiers.count > 0 else {
        engine.connect(playerNode, to: engine.mainMixerNode, format: format)
        return
    }
    audioModifiers.forEach { engine.attach($0) }
    let node = audioModifiers[i]; var i = 1 
    engine.connect(playerNode, to: node, format: engineAudioFormat)
    while i < audioModifiers.count {
        let lastNode = audioModifiers[i - 1]
        let currNode = audioModifiers[i]
        engine.connect(lastNode, to: currNode, format: engineAudioFormat)
        i += 1
    }
    let finalNode = audioModifiers[audioModifiers.count - 1]
    engine.connect(finalNode, to: engine.mainMixerNode, format: format)
}