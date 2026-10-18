import SwiftUI
import AVKit

struct DiseaseDetailView: View {

    let disease: Disease

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        ZStack {

            // LIGHT BACKGROUND
            LinearGradient(
                colors: [
                    Color(red: 0.94, green: 0.98, blue: 1.0),
                    Color(red: 0.92, green: 1.0, blue: 0.96),
                    Color.white
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()


            // MAIN SCROLL VIEW
            ScrollView(.vertical, showsIndicators: true) {

                VStack(alignment: .leading, spacing: 35) {

                    // =====================================
                    // DISEASE IMAGE
                    // =====================================

                    Image(disease.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 340)
                        .clipped()
                        .clipShape(
                            RoundedRectangle(cornerRadius: 30)
                        )
                        .shadow(
                            color: Color.black.opacity(0.12),
                            radius: 12,
                            x: 0,
                            y: 5
                        )


                    // =====================================
                    // DISEASE TITLE
                    // =====================================

                    VStack(alignment: .leading, spacing: 10) {

                        Text(disease.name)
                            .font(
                                .system(
                                    size: 58,
                                    weight: .bold
                                )
                            )
                            .foregroundStyle(
                                Color(
                                    red: 0.05,
                                    green: 0.23,
                                    blue: 0.38
                                )
                            )

                        Text(disease.category)
                            .font(.title2.bold())
                            .foregroundStyle(.teal)
                    }


                    // =====================================
                    // ABOUT
                    // =====================================

                    VStack(
                        alignment: .leading,
                        spacing: 20
                    ) {

                        HStack(spacing: 15) {

                            Image(
                                systemName:
                                    "heart.text.square.fill"
                            )
                            .font(.title)
                            .foregroundStyle(.blue)

                            Text("About")
                                .font(.title.bold())
                                .foregroundStyle(
                                    Color(
                                        red: 0.05,
                                        green: 0.28,
                                        blue: 0.48
                                    )
                                )
                        }


                        Text(disease.summary)
                            .font(.title2)
                            .foregroundStyle(
                                Color.black.opacity(0.75)
                            )
                            .lineSpacing(7)
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(32)
                    .background(Color.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 28)
                    )
                    .shadow(
                        color: Color.black.opacity(0.07),
                        radius: 12,
                        x: 0,
                        y: 5
                    )
                    .focusable()


                    // =====================================
                    // PREVENTION
                    // =====================================

                    VStack(
                        alignment: .leading,
                        spacing: 25
                    ) {

                        HStack(spacing: 15) {

                            Image(
                                systemName: "shield.fill"
                            )
                            .font(.title)
                            .foregroundStyle(.green)

                            Text("Prevention Tips")
                                .font(.title.bold())
                                .foregroundStyle(
                                    Color(
                                        red: 0.04,
                                        green: 0.45,
                                        blue: 0.28
                                    )
                                )
                        }


                        ForEach(
                            disease.prevention,
                            id: \.self
                        ) { tip in

                            HStack(
                                alignment: .top,
                                spacing: 18
                            ) {

                                Image(
                                    systemName:
                                        "checkmark.circle.fill"
                                )
                                .foregroundStyle(.green)

                                Text(tip)
                                    .foregroundStyle(
                                        Color.black.opacity(0.75)
                                    )
                            }
                            .font(.title2)
                        }
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(32)
                    .background(
                        Color.green.opacity(0.06)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 28)
                    )
                    .overlay {

                        RoundedRectangle(
                            cornerRadius: 28
                        )
                        .stroke(
                            Color.green.opacity(0.20),
                            lineWidth: 2
                        )
                    }
                    .focusable()


                    // =====================================
                    // WARNING SIGNS
                    // =====================================

                    VStack(
                        alignment: .leading,
                        spacing: 25
                    ) {

                        HStack(spacing: 15) {

                            Image(
                                systemName:
                                    "exclamationmark.triangle.fill"
                            )
                            .font(.title)
                            .foregroundStyle(.orange)

                            Text("Warning Signs")
                                .font(.title.bold())
                                .foregroundStyle(
                                    Color(
                                        red: 0.80,
                                        green: 0.32,
                                        blue: 0.05
                                    )
                                )
                        }


                        ForEach(
                            disease.warningSigns,
                            id: \.self
                        ) { sign in

                            HStack(
                                alignment: .top,
                                spacing: 18
                            ) {

                                Image(
                                    systemName:
                                        "exclamationmark.circle.fill"
                                )
                                .foregroundStyle(.orange)

                                Text(sign)
                                    .foregroundStyle(
                                        Color.black.opacity(0.75)
                                    )
                            }
                            .font(.title2)
                        }
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(32)
                    .background(
                        Color.orange.opacity(0.07)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 28)
                    )
                    .overlay {

                        RoundedRectangle(
                            cornerRadius: 28
                        )
                        .stroke(
                            Color.orange.opacity(0.25),
                            lineWidth: 2
                        )
                    }
                    .focusable()


                    // =====================================
                    // VIDEO SECTION
                    // =====================================

                    VStack(
                        alignment: .leading,
                        spacing: 20
                    ) {

                        HStack(spacing: 15) {

                            Image(
                                systemName:
                                    "play.rectangle.fill"
                            )
                            .font(.title)
                            .foregroundStyle(.blue)

                            Text("Watch & Learn")
                                .font(.title.bold())
                                .foregroundStyle(
                                    Color(
                                        red: 0.05,
                                        green: 0.28,
                                        blue: 0.48
                                    )
                                )
                        }


                        Text(
                            "Watch this short educational video to learn more about \(disease.name)."
                        )
                        .font(.title3)
                        .foregroundStyle(
                            Color.black.opacity(0.65)
                        )


                        DiseaseVideoPlayer(
                            videoName: disease.videoName
                        )
                        .frame(height: 420)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                        )
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(32)
                    .background(Color.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 28)
                    )
                    .shadow(
                        color: Color.black.opacity(0.08),
                        radius: 12,
                        x: 0,
                        y: 5
                    )
                    .focusable()


                    // =====================================
                    // MEDICAL INFORMATION NOTICE
                    // =====================================

                    HStack(
                        alignment: .top,
                        spacing: 18
                    ) {

                        Image(
                            systemName: "info.circle.fill"
                        )
                        .font(.title2)
                        .foregroundStyle(.blue)


                        VStack(
                            alignment: .leading,
                            spacing: 8
                        ) {

                            Text("Important")
                                .font(.headline.bold())
                                .foregroundStyle(.blue)

                            Text(
                                "This information is for general awareness only. Please consult a qualified healthcare professional for personal medical advice."
                            )
                            .foregroundStyle(
                                Color.black.opacity(0.65)
                            )
                        }
                    }
                    .font(.headline)
                    .padding(25)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .background(
                        Color.blue.opacity(0.07)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .focusable()


                    // =====================================
                    // ONLY BACK BUTTON
                    // =====================================

                    HStack {

                        Spacer()

                        Button {

                            dismiss()

                        } label: {

                            HStack(spacing: 10) {

                                Image(
                                    systemName: "chevron.left"
                                )

                                Text("Back to Diseases")
                            }
                            .font(.headline)
                        }
                        .buttonStyle(.bordered)
                        .tint(
                            Color(
                                red: 0.05,
                                green: 0.40,
                                blue: 0.55
                            )
                        )

                        Spacer()
                    }
                    .padding(.top, 10)


                    // Extra bottom space
                    Color.clear
                        .frame(height: 120)
                }

                .padding(.horizontal, 70)
                .padding(.top, 45)
                .padding(.bottom, 100)
            }
        }
    }
}
