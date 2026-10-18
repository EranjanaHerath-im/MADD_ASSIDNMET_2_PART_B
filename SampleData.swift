//
//  SampleData.swift
//  HealthAwareTV
//
//  Created by STUDENT on 2026-10-17.
//

/*import Foundation

struct SampleData {
    static let diseases: [Disease] = [
        Disease(
            name: "Diabetes",
            category: "Chronic",
            summary: "A condition where the body has trouble controlling blood sugar levels.",
            prevention: ["Eat balanced meals", "Exercise regularly", "Maintain healthy weight", "Limit sugary drinks"],
            warningSigns: ["Frequent thirst", "Increased urination", "Unexplained tiredness", "Blurred vision"]
        ),
        Disease(
            name: "Hypertension",
            category: "Chronic",
            summary: "High blood pressure that can increase the risk of heart disease and stroke.",
            prevention: ["Reduce salt intake", "Exercise regularly", "Manage stress", "Avoid smoking"],
            warningSigns: ["Often no clear symptoms", "Headaches", "Shortness of breath", "Nosebleeds in severe cases"]
        ),
        Disease(
            name: "Asthma",
            category: "Respiratory",
            summary: "A condition that causes breathing difficulties due to narrowed airways.",
            prevention: ["Avoid triggers (dust, smoke)", "Take prescribed medication", "Keep indoor air clean"],
            warningSigns: ["Wheezing", "Chest tightness", "Shortness of breath", "Coughing at night"]
        ),
     */


import Foundation

struct SampleData {

    static let diseases: [Disease] = [

        Disease(
            name: "Diabetes",
            category: "Chronic",
            summary: "A condition where the body has trouble controlling blood sugar levels.",
            prevention: [
                "Eat balanced meals",
                "Exercise regularly",
                "Maintain healthy weight",
                "Limit sugary drinks"
            ],
            warningSigns: [
                "Frequent thirst",
                "Increased urination",
                "Unexplained tiredness",
                "Blurred vision"
            ],
            imageName: "diabetes",
            videoName: "diabetes_video"
        ),

        Disease(
            name: "Hypertension",
            category: "Chronic",
            summary: "High blood pressure that can increase the risk of heart disease and stroke.",
            prevention: [
                "Reduce salt intake",
                "Exercise regularly",
                "Manage stress",
                "Avoid smoking"
            ],
            warningSigns: [
                "Often no clear symptoms",
                "Headaches",
                "Shortness of breath",
                "Nosebleeds in severe cases"
            ],
            imageName: "hypertension",
            videoName: "hypertension_video"
        ),

        Disease(
            name: "Asthma",
            category: "Respiratory",
            summary: "A condition that causes breathing difficulties due to narrowed airways.",
            prevention: [
                "Avoid triggers such as dust and smoke",
                "Take prescribed medication",
                "Keep indoor air clean"
            ],
            warningSigns: [
                "Wheezing",
                "Chest tightness",
                "Shortness of breath",
                "Coughing at night"
            ],
            imageName: "asthma",
            videoName: "asthma_video"
        ),

        Disease(
            name: "Common Cold",
            category: "Infectious",
            summary: "A viral infection of the nose and throat.",
            prevention: [
                "Wash hands often",
                "Avoid close contact with sick people",
                "Cover coughs and sneezes"
            ],
            warningSigns: [
                "Runny nose",
                "Sore throat",
                "Cough",
                "Mild fever"
            ],
            imageName: "commoncold",
            videoName: "cold_video"
        )
    ]
}
