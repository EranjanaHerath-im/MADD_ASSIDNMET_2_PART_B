import SwiftUI

struct QuizView: View {

    @Environment(\.dismiss) private var dismiss


    // MARK: - Question Model

    struct QuizQuestion {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }


    // MARK: - Questions

    let questions: [QuizQuestion] = [

        QuizQuestion(
            question: "Which habit can help support healthy blood pressure?",
            answers: [
                "Eating more salt",
                "Regular physical activity",
                "Smoking",
                "Avoiding exercise"
            ],
            correctAnswer: 1
        ),

        QuizQuestion(
            question: "Which is a common warning sign associated with asthma?",
            answers: [
                "Wheezing",
                "Broken bone",
                "Toothache",
                "Hair loss"
            ],
            correctAnswer: 0
        ),

        QuizQuestion(
            question: "Which habit can help reduce the spread of the common cold?",
            answers: [
                "Sharing drinking cups",
                "Avoiding hand washing",
                "Washing hands regularly",
                "Touching your face frequently"
            ],
            correctAnswer: 2
        ),

        QuizQuestion(
            question: "Which habit supports general health and may help reduce the risk of type 2 diabetes?",
            answers: [
                "Regular physical activity",
                "Drinking more sugary drinks",
                "Smoking",
                "Avoiding physical activity"
            ],
            correctAnswer: 0
        )
    ]


    // MARK: - States

    @State private var currentQuestion = 0
    @State private var selectedAnswer: Int?
    @State private var showResult = false
    @State private var score = 0
    @State private var quizFinished = false


    var body: some View {

        ZStack {

            // BACKGROUND

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


            if quizFinished {

                resultScreen

            } else {

                quizScreen
            }
        }
        .navigationBarBackButtonHidden(true)
    }


    // MARK: - QUIZ SCREEN

    private var quizScreen: some View {

        ScrollView(
            .vertical,
            showsIndicators: true
        ) {

            VStack(spacing: 30) {

                // HOME BUTTON

                HStack {

                    Button {

                        dismiss()

                    } label: {

                        Label(
                            "Home",
                            systemImage: "house.fill"
                        )
                        .font(.headline)
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)

                    Spacer()
                }
                .frame(maxWidth: 900)


                // ICON

                Image(
                    systemName: "brain.head.profile"
                )
                .font(.system(size: 65))
                .foregroundStyle(.blue)


                // TITLE

                Text("Health Check")
                    .font(
                        .system(
                            size: 48,
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


                // QUESTION NUMBER

                Text(
                    "Question \(currentQuestion + 1) of \(questions.count)"
                )
                .font(.title3.bold())
                .foregroundStyle(.blue)


                // QUESTION CARD

                VStack(spacing: 28) {

                    Text(
                        questions[currentQuestion].question
                    )
                    .font(.title.bold())
                    .foregroundStyle(
                        Color(
                            red: 0.07,
                            green: 0.28,
                            blue: 0.48
                        )
                    )
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)


                    // ANSWERS

                    ForEach(
                        0..<questions[currentQuestion].answers.count,
                        id: \.self
                    ) { index in

                        Button {

                            selectAnswer(index)

                        } label: {

                            HStack(spacing: 15) {

                                Text(
                                    questions[currentQuestion]
                                        .answers[index]
                                )

                                Spacer()


                                if showResult {

                                    // CORRECT ANSWER

                                    if index ==
                                        questions[currentQuestion]
                                            .correctAnswer {

                                        Image(
                                            systemName:
                                                "checkmark.circle.fill"
                                        )
                                        .foregroundStyle(.green)


                                    // WRONG SELECTED ANSWER

                                    } else if index ==
                                                selectedAnswer {

                                        Image(
                                            systemName:
                                                "xmark.circle.fill"
                                        )
                                        .foregroundStyle(.red)
                                    }
                                }
                            }
                            .font(.title2.bold())
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        }
                        .buttonStyle(.bordered)
                        .tint(
                            answerColor(for: index)
                        )
                        .disabled(showResult)
                    }


                    // RESULT

                    if showResult {

                        Divider()
                            .padding(.vertical, 10)


                        if selectedAnswer ==
                            questions[currentQuestion]
                                .correctAnswer {

                            Label(
                                "Correct!",
                                systemImage:
                                    "checkmark.circle.fill"
                            )
                            .font(.title.bold())
                            .foregroundStyle(.green)

                        } else {

                            Label(
                                "Not quite. The correct answer is highlighted.",
                                systemImage:
                                    "info.circle.fill"
                            )
                            .font(.title2.bold())
                            .foregroundStyle(.orange)
                        }


                        // NEXT BUTTON

                        Button {

                            nextQuestion()

                        } label: {

                            Label(
                                currentQuestion ==
                                    questions.count - 1
                                    ? "View Results"
                                    : "Next Question",
                                systemImage: "arrow.right"
                            )
                            .font(.title2.bold())
                        }
                        .buttonStyle(
                            .borderedProminent
                        )
                        .tint(.blue)
                        .padding(.top, 10)
                    }
                }
                .padding(40)
                .frame(maxWidth: 900)
                .background(Color.white)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 30
                    )
                )
                .shadow(
                    color:
                        Color.blue.opacity(0.12),
                    radius: 15,
                    x: 0,
                    y: 6
                )


                // BOTTOM SPACE

                Color.clear
                    .frame(height: 120)
            }
            .frame(
                maxWidth: .infinity
            )
            .padding(.horizontal, 60)
            .padding(.top, 40)
            .padding(.bottom, 100)
        }
    }


    // MARK: - RESULT SCREEN

    private var resultScreen: some View {

        ScrollView(
            .vertical,
            showsIndicators: true
        ) {

            VStack(spacing: 30) {

                Image(
                    systemName:
                        "checkmark.seal.fill"
                )
                .font(.system(size: 85))
                .foregroundStyle(.green)


                Text("Quiz Completed!")
                    .font(
                        .system(
                            size: 48,
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


                Text("Your Score")
                    .font(.title2)
                    .foregroundStyle(
                        .secondary
                    )


                Text(
                    "\(score) / \(questions.count)"
                )
                .font(
                    .system(
                        size: 60,
                        weight: .bold
                    )
                )
                .foregroundStyle(.blue)


                Text(resultMessage)
                    .font(.title2.bold())
                    .foregroundStyle(.green)
                    .multilineTextAlignment(
                        .center
                    )


                // TRY AGAIN

                Button {

                    restartQuiz()

                } label: {

                    Label(
                        "Try Again",
                        systemImage:
                            "arrow.clockwise"
                    )
                    .font(.title2.bold())
                }
                .buttonStyle(
                    .borderedProminent
                )
                .tint(.blue)


                // HOME

                Button {

                    dismiss()

                } label: {

                    Label(
                        "Back to Home",
                        systemImage:
                            "house.fill"
                    )
                    .font(.headline)
                }
                .buttonStyle(.bordered)
                .tint(.blue)


                Color.clear
                    .frame(height: 120)
            }
            .frame(
                maxWidth: .infinity
            )
            .padding(60)
        }
    }


    // MARK: - Select Answer

    private func selectAnswer(
        _ index: Int
    ) {

        guard !showResult else {
            return
        }

        selectedAnswer = index
        showResult = true


        if index ==
            questions[currentQuestion]
                .correctAnswer {

            score += 1
        }
    }


    // MARK: - Next Question

    private func nextQuestion() {

        if currentQuestion <
            questions.count - 1 {

            currentQuestion += 1

            selectedAnswer = nil
            showResult = false

        } else {

            quizFinished = true
        }
    }


    // MARK: - Restart Quiz

    private func restartQuiz() {

        currentQuestion = 0
        selectedAnswer = nil
        showResult = false
        score = 0
        quizFinished = false
    }


    // MARK: - Answer Color

    private func answerColor(
        for index: Int
    ) -> Color {

        guard showResult else {

            return .blue
        }


        if index ==
            questions[currentQuestion]
                .correctAnswer {

            return .green
        }


        if index ==
            selectedAnswer {

            return .red
        }


        return .gray
    }


    // MARK: - Result Message

    private var resultMessage: String {

        if score ==
            questions.count {

            return "Excellent! Great health awareness."

        } else if score >=
                    questions.count / 2 {

            return "Good job! Keep learning."

        } else {

            return "Keep learning and try again!"
        }
    }
}


#Preview {

    NavigationStack {

        QuizView()
    }
}
