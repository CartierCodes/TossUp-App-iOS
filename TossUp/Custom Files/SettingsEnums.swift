//
//  SettingsEnums.swift
//  TossUp
//
//  Created by Carter Burzlaff on 7/15/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

private protocol AssociatedVC {
    var connectedVC: UIViewController { get }
}

private protocol IconName {
    var icon: String { get }
}

// For the form VCs
private protocol CellSize {
    var cellSize: CGFloat { get }
}

private protocol SectionTitles {
    var sectionTitles: [String] { get }
}

private protocol BannerTitle {
    var bannerTitle: String { get }
}

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case options
    case video
    case info
    case support
    
    var description: String {
        switch self {
            case .options: return "OPTIONS"
            case .video: return "VIDEO SETTINGS"
            case .info: return "INFO"
            case .support: return "SUPPORT"
        }
    }
}

enum Options: Int, CaseIterable, CustomStringConvertible, IconName, AssociatedVC {
    case premium
    case notifications
    case downloads
    
    var description: String {
        switch self {
            case .premium: return "Premium (No Ads)"
            case .notifications: return "Notifications"
            case .downloads: return "Download Videos"
        }
    }
    
    var icon: String {
        switch self {
            case .premium: return "checkmark.seal.fill"
            case .notifications: return "bell.fill"
            case .downloads: return "icloud.and.arrow.down.fill"
        }
    }
    
    var connectedVC: UIViewController {
        switch self {
            case .premium: return UIViewController()
            case .notifications: return UIViewController()
            case .downloads: return DownloadsVC()
        }
    }
}

enum Video: Int, CaseIterable, CustomStringConvertible, IconName {
    case autoplay
    case landscapeOnly
    case landscapeStart
    
    var description: String {
        switch self {
            case .autoplay: return "Autoplay video"
            case .landscapeOnly: return "Landscape only"
            case .landscapeStart: return "Home button on the:"
        }
    }
    
    var icon: String {
        switch self {
            case .autoplay: return "forward.fill"
            case .landscapeOnly: return "play.rectangle.fill"
            case .landscapeStart: return "arrow.right.arrow.left.square.fill"
        }
    }
}

enum Info: Int, CaseIterable, CustomStringConvertible, IconName, AssociatedVC {
    case about
    case changes
    case help
    
    var description: String {
        switch self {
            case .about: return "About"
            case .changes: return "Changelog"
            case .help: return "Help"
        }
    }
    
    var icon: String {
        switch self {
            case .about: return "info.circle.fill"
            case .changes: return "doc.fill"
            case .help: return "questionmark.circle.fill"
        }
    }
    
    var connectedVC: UIViewController {
        switch self {
            case .about: return AboutVC()
            case .changes: return ChangelogVC()
            case .help: return HelpVC()
        }
    }
}

enum Support: Int, CaseIterable, CustomStringConvertible, IconName, AssociatedVC, BannerTitle, CellSize, SectionTitles {
    case grenade
    case feature
    case bug
    
    var description: String {
        switch self {
            case .grenade: return "Submit a new grenade location"
            case .feature: return "Request a new feature"
            case .bug: return "Report a bug / problem"
        }
    }
    
    var icon: String {
        switch self {
            case .grenade: return "envelope.fill"
            case .feature: return "plus.circle.fill"
            case .bug: return "ant.fill"
        }
    }
    
    var bannerTitle: String {
        switch self {
            case .grenade: return "Grenade Submission"
            case .feature: return "Request Feature"
            case .bug: return "Report a Bug"
        }
    }
    
    var connectedVC: UIViewController {
        return FormSubmissionVC()
    }
    
    var cellSize: CGFloat {
        switch self {
            case .grenade: return 40
            case .feature: return 300
            case .bug: return 300
        }
    }
    
    var sectionTitles: [String] {
        switch self {
            case .grenade: return ["MAP", "GRENADE TYPE", "LOCATION", "WHERE TO THROW FROM"]
            case .feature: return ["DESCRIBE THE FEATURE YOU WANT ADDED"]
            case .bug: return ["PLEASE DESCRIBE THE BUG / PROBLEM"]
        }
    }
}
