//
//  Disease.swift
//  HealthAwareTV
//
//  Created by STUDENT on 2026-10-17.
//

import Foundation

struct Disease: Identifiable, Hashable {
    let id = UUID()

    let name: String
    let category: String
    let summary: String
    let prevention: [String]
    let warningSigns: [String]

    let imageName: String
    let videoName: String
}
