import SwiftUI
import AVKit

struct DiseaseVideoPlayer: View {

    let videoName: String

    @State private var player: AVPlayer?
    @State private var videoFound = true
    @State private var isLoading = true

    var body: some View {

        ZStack {

            // Light background
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.blue.opacity(0.05))


            // VIDEO PLAYER
            if let player = player {

                VideoPlayer(player: player)
                    .frame(maxWidth: .infinity)
                    .frame(height: 420)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 22)
                    )


            // VIDEO NOT FOUND
            } else if !videoFound {

                VStack(spacing: 18) {

                    Image(systemName: "video.slash.fill")
                        .font(.system(size: 55))
                        .foregroundStyle(.red)

                    Text("Video could not be loaded")
                        .font(.title2.bold())
                        .foregroundStyle(.red)

                    Text("\(videoName).mp4")
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    Text("Check that the video is included in the HealthAwareTV target.")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }


            // LOADING
            } else if isLoading {

                VStack(spacing: 18) {

                    ProgressView()
                        .scaleEffect(1.5)

                    Text("Loading video...")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 420)
        .onAppear {
            loadVideo()
        }
        .onDisappear {

            player?.pause()
        }
    }


    // MARK: - Load Video

    private func loadVideo() {

        isLoading = true
        videoFound = true

        // Find the MP4 inside the application bundle
        guard let videoURL = Bundle.main.url(
            forResource: videoName,
            withExtension: "mp4"
        ) else {

            print("❌ VIDEO NOT FOUND")
            print("Expected: \(videoName).mp4")

            videoFound = false
            isLoading = false

            return
        }


        print("================================")
        print("✅ VIDEO FOUND")
        print("Name: \(videoName).mp4")
        print("Path: \(videoURL.path)")
        print("================================")


        // Create player
        let newPlayer = AVPlayer(
            url: videoURL
        )


        player = newPlayer

        isLoading = false


        // Automatically start video
        newPlayer.play()
    }
}
