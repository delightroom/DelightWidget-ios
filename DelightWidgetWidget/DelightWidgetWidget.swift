//
//  DelightWidgetWidget.swift
//  DelightWidgetWidget
//
//  Created by smis on 2020/10/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emojiDetails: EmojiProvider.random())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emojiDetails: EmojiDetails
}

struct DelightWidgetWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        DelightWidgetWidgetView(emojiDetails: entry.emojiDetails)
    }
}

@main
struct DelightWidgetWidget: Widget {
    let kind: String = "DelightWidgetWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DelightWidgetWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Delight Widget")
        .description("Delight widget description.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct DelightWidgetWidget_Previews: PreviewProvider {
    static var previews: some View {
        DelightWidgetWidgetEntryView(entry: SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
