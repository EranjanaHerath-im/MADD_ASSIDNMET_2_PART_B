import SwiftUI

struct HomeView: View {

    var body: some View {

        NavigationStack {

            ZStack {

                // MARK: - Background

                LinearGradient(
                    colors: [
                        Color.white,
                        Color(
                            red: 0.88,
                            green: 0.96,
                            blue: 1.0
                        )
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()


                // MARK: - Scrollable Content

                ScrollView(.vertical, showsIndicators: true) {

                    VStack(spacing: 30) {

                        // RED HEART

                        Image(systemName: "heart.fill")
                            .font(.system(size: 85))
                            .foregroundStyle(.red)


                        // TITLE

                        Text("HealthAware TV")
                            .font(
                                .system(
                                    size: 58,
                                    weight: .bold
                                )
                            )
                            .foregroundStyle(
                                Color(
                                    red: 0.07,
                                    green: 0.28,
                                    blue: 0.48
                                )
                            )


                        // TAGLINE

                        Text("Learn • Prevent • Stay Aware")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)


                        // DESCRIPTION

                        Text(
                            "Learn about common diseases, prevention tips, warning signs and healthy habits."
                        )
                        .font(.title3)
                        .foregroundStyle(
                            Color.black.opacity(0.65)
                        )
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 750)


                        // MARK: - Explore Diseases

                        NavigationLink {

                            DiseaseListView()

                        } label: {

                            HStack(spacing: 15) {

                                Image(
                                    systemName: "heart.text.square.fill"
                                )

                                VStack(
                                    alignment: .leading,
                                    spacing: 4
                                ) {

                                    Text("Explore Health Topics")
                                        .font(.title2.bold())

                                    Text(
                                        "Learn about diseases and prevention"
                                    )
                                    .font(.headline)
                                    .opacity(0.8)
                                }

                                Spacer()

                                Image(
                                    systemName: "chevron.right"
                                )
                            }
                            .padding(25)
                            .frame(maxWidth: 800)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(
                            Color(
                                red: 0.15,
                                green: 0.55,
                                blue: 0.82
                            )
                        )


                        // MARK: - Health Quiz

                        NavigationLink {

                            QuizView()

                        } label: {

                            HStack(spacing: 15) {

                                Image(
                                    systemName: "brain.head.profile"
                                )

                                VStack(
                                    alignment: .leading,
                                    spacing: 4
                                ) {

                                    Text("Take Health Quiz")
                                        .font(.title2.bold())

                                    Text(
                                        "Test your health awareness"
                                    )
                                    .font(.headline)
                                    .opacity(0.8)
                                }

                                Spacer()

                                Image(
                                    systemName: "chevron.right"
                                )
                            }
                            .padding(25)
                            .frame(maxWidth: 800)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(
                            Color(
                                red: 0.15,
                                green: 0.65,
                                blue: 0.58
                            )
                        )


                        // Extra space at bottom
                        Color.clear
                            .frame(height: 100)
                    }
                    .frame(
                        maxWidth: .infinity
                    )
                    .padding(.horizontal, 70)
                    .padding(.top, 45)
                    .padding(.bottom, 80)
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
