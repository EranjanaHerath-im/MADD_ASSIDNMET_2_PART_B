**SE4041 – Mobile Application Design and Development**

Assignment 2 – Part B

**HealthAware TV**

Advanced iOS Library Management Application

IT23241046 – ERANJANA M.H.M

# HealthAware TV

## Overview

HealthAware TV is an educational health-awareness application developed for Apple tvOS using Swift and SwiftUI.

The application is designed to present health information in a simple, visual, and television-friendly format. Users can explore common diseases, learn about prevention methods and warning signs, watch educational videos, and complete a health-awareness quiz.

The application is intended for general educational and awareness purposes only and does not provide medical diagnosis or personalised medical advice.

**Main Features**

**Disease Explorer**

Users can browse health topics using visual disease cards designed for television viewing.

Current topics include:

- Diabetes
- Hypertension
- Asthma
- Common Cold

**Disease Information**

Each disease includes:

- Disease name
- Disease category
- Short description
- Prevention tips
- Warning signs

**Disease Images**

Each disease contains a relevant visual image to make the health information easier to understand and the interface more engaging.

**Educational Videos**

Disease detail screens include educational video content using Apple's AVKit \`VideoPlayer\`.

Videos are stored locally within the application project.

**Health Awareness Quiz**

The application includes an interactive quiz where users can test their understanding of basic health-awareness topics.

The quiz provides:

- Multiple-choice questions
- Immediate correct/incorrect feedback
- Correct-answer highlighting
- Score tracking
- Final results
- Option to restart the quiz

**tvOS Navigation**

The interface is designed for Apple TV and supports focus-based navigation.

Users can navigate between:

Home Screen

→ Disease Library

→ Disease Detail

and:

Home Screen

→ Health Quiz

Navigation controls are also provided to return to previous screens.

**User Interface Design**

HealthAware TV uses a simple and accessible visual style designed for television viewing.

The main colour palette includes:

- White
- Light blue
- Dark blue
- Red
- Green
- Orange

Colours are used consistently throughout the application.

**Colour Meaning**

- Blue: General health information
- Green: Prevention information and correct quiz answers
- Orange: Warning signs
- Red: Important visual elements and incorrect quiz answers
- Light blue and white: Main application background

Large typography, spacing, cards, and focusable controls are used to improve readability from television viewing distance.

**Technologies Used**

The application was developed using:

- Swift
- SwiftUI
- tvOS
- Xcode
- AVKit
- AVPlayer
- VideoPlayer
- NavigationStack
- SF Symbols
- Git / GitHub

**Project Structure**

The project is organised into separate models, data, views, reusable components, images, and video resources.

Example structure:

HealthAwareTV

- HealthAwareTVApp.swift
- Disease.swift
- SampleData.swift
- HomeView.swift
- DiseaseListView.swift
- DiseaseDetailView.swift
- DiseaseVideoPlayer.swift
- QuizView.swift
- Assets.xcassets
- Video resources

**Main Swift Files**

**HealthAwareTVApp.swift**

The application entry point.

It loads \`HomeView\` when the application starts.

**Disease.swift**

Defines the \`Disease\` data model.

A disease contains:

- Name
- Category
- Summary
- Prevention tips
- Warning signs
- Image name
- Video name

**SampleData.swift**

Stores the sample disease information used by the prototype.

**HomeView.swift**

Provides the main application screen.

Users can navigate from this screen to:

- Explore Health Topics
- Health Quiz

**DiseaseListView.swift**

Displays the available diseases as visual cards.

Selecting a disease opens its Disease Detail screen.

**DiseaseDetailView.swift**

Displays detailed health-awareness information including:

- Disease image
- Category
- Description
- Prevention tips
- Warning signs
- Educational video
- Medical-information notice

**DiseaseVideoPlayer.swift**

Uses \`AVPlayer\` and \`VideoPlayer\` from AVKit to display locally stored educational videos.

**QuizView.swift**

Contains the interactive health-awareness quiz.

It manages:

- Questions
- Multiple-choice answers
- User selections
- Correct/incorrect feedback
- Score calculation
- Final quiz results

**Requirements**

To build and run the project, the following are required:

- macOS
- Xcode with tvOS development support
- Apple TV Simulator or compatible Apple TV development environment
- HealthAwareTV Xcode project source files

**How to Build and Run**

**1\. Open the Project**

Open the HealthAwareTV project in Xcode.

**2\. Check the Project Target**

Make sure the HealthAwareTV tvOS target is selected.

**3\. Check Image Resources**

Open:

Assets.xcassets

Make sure the required disease image assets are included.

The current application expects image asset names such as:

- diabetes
- hypertension
- asthma
- commoncold

**4\. Check Video Resources**

Make sure the required MP4 resources have been added to the HealthAwareTV target.

The current project uses video resources such as:

- diabetes_video.mp4
- hypertension_video.mp4
- asthma_video.mp4
- cold_video.mp4

In Xcode, verify that the video resources are included in the HealthAwareTV target and application bundle.

**5\. Select an Apple TV Simulator**

From the Xcode device/simulator selector, choose an appropriate Apple TV simulator.

**6\. Build the Application**

Build the project using:

Command + B

Resolve any build errors before running the application.

**7\. Run the Application**

Run the application using:

Command + R

Xcode will launch the selected Apple TV simulator and start HealthAware TV.

**How to Use the Application**

**Explore Diseases**

1. Launch HealthAware TV.
2. Select "Explore Health Topics."
3. Navigate through the available disease cards.
4. Select a disease.
5. View the disease overview.
6. Read the prevention tips.
7. Read the warning signs.
8. Navigate to the educational video section.
9. Play the available video.
10. Return to the disease library when finished.

**Take the Health Quiz**

1. Return to the Home screen.
2. Select "Take Health Quiz."
3. Read the question.
4. Select an answer.
5. View the feedback.
6. Continue to the next question.
7. Complete all questions.
8. View the final score.
9. Restart the quiz or return to the Home screen.

**tvOS Design Considerations**

The application was designed specifically for television interaction.

Important design considerations include:

- Large readable text
- Large interactive controls
- Focus-based navigation
- Apple TV remote-friendly interaction
- Short pieces of information
- High visual contrast
- Consistent colour usage
- Visual disease cards
- Limited text density
- Clear screen hierarchy

**Code Documentation**

The Swift source code is organised into separate files according to responsibility.

Code should use:

- Clear and descriptive variable names
- Consistent Swift naming conventions
- MARK comments for major sections
- Comments where application logic requires explanation
- Reusable SwiftUI components where appropriate
- Separation between data models, sample data, UI, and media playback

Example:

\`\`\`swift

// MARK: - Load Video

/// Loads the disease video from the application bundle.

private func loadVideo() {

guard let videoURL = Bundle.main.url(

forResource: videoName,

withExtension: "mp4"

) else {

return

}

player = AVPlayer(url: videoURL)

}