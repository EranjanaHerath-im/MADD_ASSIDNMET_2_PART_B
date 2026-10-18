import SwiftUI

struct DiseaseListView: View {
    
    @Environment(\.dismiss) private var dismiss

    let diseases = SampleData.diseases

    var body: some View {

        ZStack {

            // White + Light Blue Background
            LinearGradient(
                colors: [
                    Color.white,
                    Color(red: 0.88, green: 0.96, blue: 1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()


            ScrollView {

                VStack(alignment: .leading, spacing: 35) {

                    // PAGE TITLE
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Label("Home", systemImage: "house.fill")
                                    .font(.headline)
                            }
                            .buttonStyle(.bordered)
                            .tint(.blue)

                            Spacer()
                        }
                        
                        Text("Explore Diseases")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundStyle(
                                Color(
                                    red: 0.07,
                                    green: 0.28,
                                    blue: 0.48
                                )
                            )

                        Text("Choose a health topic to learn more")
                            .font(.title3)
                            .foregroundStyle(
                                Color.black.opacity(0.6)
                            )
                    }


                    // DISEASE GRID
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                        spacing: 35
                    ) {

                        ForEach(diseases) { disease in

                            NavigationLink {

                                DiseaseDetailView(
                                    disease: disease
                                )

                            } label: {

                                VStack(
                                    alignment: .leading,
                                    spacing: 16
                                ) {

                                    // IMAGE
                                    Image(disease.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 220)
                                        .clipped()
                                        .clipShape(
                                            RoundedRectangle(
                                                cornerRadius: 20
                                            )
                                        )


                                    // DISEASE NAME
                                    Text(disease.name)
                                        .font(.title2.bold())
                                        .foregroundStyle(
                                            Color(
                                                red: 0.07,
                                                green: 0.28,
                                                blue: 0.48
                                            )
                                        )


                                    // CATEGORY
                                    HStack(spacing: 8) {

                                        Image(
                                            systemName: "cross.case.fill"
                                        )

                                        Text(disease.category)
                                    }
                                    .font(.headline)
                                    .foregroundStyle(
                                        Color(
                                            red: 0.05,
                                            green: 0.52,
                                            blue: 0.68
                                        )
                                    )
                                }
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .leading
                                )
                                .padding(20)
                                .background(Color.white)
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 26
                                    )
                                )
                                .shadow(
                                    color: Color.blue.opacity(0.12),
                                    radius: 12,
                                    x: 0,
                                    y: 5
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal, 60)
                .padding(.vertical, 50)
            }
        }
        .navigationTitle("Diseases")
    }
}

#Preview {

    NavigationStack {
        DiseaseListView()
    }
}
