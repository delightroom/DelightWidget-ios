//
//  DelightWidgetWidgetView.swift
//  DelightWidgetWidgetExtension
//
//  Created by smis on 2020/10/21.
//

import WidgetKit
import SwiftUI

struct DelightWidgetWidgetView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    let emojiDetails: EmojiDetails
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallDelightWidgetWidgetView(emojiDetails: emojiDetails)
        case .systemMedium:
            MediumDelightWidgetWidgetView(emojiDetails: emojiDetails)
        case .systemLarge:
            LargeDelightWidgetWidgetView(emojiDetails: emojiDetails)
        @unknown default:
            EmptyView()
        }
    }
}

struct SmallDelightWidgetWidgetView: View {
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emojiDetails.emoji)
                    .font(.system(size: 56))
                Text(emojiDetails.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                    .padding([.leading, .trailing])
                    .foregroundColor(.white)
            }
        }
        .widgetURL(emojiDetails.url)
    }
}


struct MediumDelightWidgetWidgetView: View {
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            HStack {
                Text(emojiDetails.emoji)
                    .font(.system(size: 56))
                    .padding()
                VStack(alignment: .leading) {
                    Text(emojiDetails.name)
                        .font(.headline)
                    Text(emojiDetails.description)
                }
                .padding([.top, .bottom, .trailing])
                .foregroundColor(.white)
            }
        }
    }
}

struct LargeDelightWidgetWidgetView: View {
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emojiDetails.name)
                    .bold()
                    .font(.title)
                Text(emojiDetails.emoji)
                    .font(.system(size: 60))
                    .padding()
                Text(emojiDetails.description)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

