public protocol ShuffleSongsUseCaseType {
    init()
    func execute(tracks: [Track]) -> [Track]
}

public struct ShuffleSongsUseCase: ShuffleSongsUseCaseType {
    public init() {}

    public func execute(tracks: [Track]) -> [Track] {
        var categorised = tracks.fyShuffled().categorise { $0.artistName }
            .shuffled()
            .reduce([String: [Track]]()) {
                var dict = $0
                dict[$1.0] = $1.1
                return dict
            }

        let tracksArray = categorised.map { $0.value }
        let numberOfArtists = categorised.keys.count
        let numberOfTracks = tracks.count
        var shuffled: [Track] = []

        guard checkIfTracksArrayByArtistsHasSameSize(tracksArray) else { return tracksArray.flatMap { $0 } }

        for i in stride(from: (numberOfTracks / numberOfArtists), through: 1, by: -1) {
            for (artist, tracks) in categorised {
                let index = Int.random(in: 0...tracks.count - i)
                shuffled.append(tracks[index])
                categorised[artist]?.remove(at: index)
            }
        }

        return shuffled
    }

    private func checkIfTracksArrayByArtistsHasSameSize(_ array: [[Track]]) -> Bool {
        let countSet = Set<Int>(array.map { $0.count })
        return countSet.count == 1
    }
}

extension Array {
    public func fyShuffled() -> Array {
        var copy = self
        for i in stride(from: copy.count - 1, through: 1, by: -1) {
            let j = Int.random(in: 0...i)
            if i != j {
                copy.swapAt(i, j)
            }
        }

        return copy
    }
}

extension Sequence {
    func categorise<U: Hashable>(_ key: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
        var dict: [U: [Iterator.Element]] = [:]

        for element in self {
            let key = key(element)
            if case nil = dict[key]?.append(element) { dict[key] = [element] }
        }

        return dict
    }
}
