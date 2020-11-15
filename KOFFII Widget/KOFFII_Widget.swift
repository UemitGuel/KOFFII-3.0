//
//  KOFFII_Widget.swift
//  KOFFII Widget
//
//  Created by Gül, Ümit on 15.11.20.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct KOFFII_Widget: Widget {
    let kind: String = "KOFFII_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            KOFFII_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

extension KOFFII_Widget {
    struct Provider: TimelineProvider {
        typealias Entry = KOFFII_Widget.Entry
        
        func placeholder(in context: Context) -> Entry {
            Entry(date: Date(), cafe: topThreeOfTheMonth[0], image: Image(topThreeOfTheMonth[0].name))
        }
        
        func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
            let entry = Entry(date: Date(), cafe: topThreeOfTheMonth[1], image: Image(topThreeOfTheMonth[0].name))
            completion(entry)
        }
        
        func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
            var entries: [Entry] = []
            
            let currentDate = Date()
            for index in 0..<topThreeOfTheMonth.count {
                let entryDate = Calendar.current.date(byAdding: .minute, value: index, to: currentDate)!
                let entry = Entry(date: entryDate, cafe: topThreeOfTheMonth[index], image: Image(topThreeOfTheMonth[index].name))
                entries.append(entry)
            }
            
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}


extension KOFFII_Widget {
    struct Entry: TimelineEntry {
        var date: Date
        var cafe: Cafe
        var image: Image
    }
}

struct KOFFII_WidgetEntryView : View {
    var entry: KOFFII_Widget.Provider.Entry
    
    @Environment(\.widgetFamily) private var widgetFamily
    
    var titleLong: some View {
        Text("Ümit´s Empfehlung: \(entry.cafe.name)")
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.primary)
    }
    
    var titleShort: some View {
        Text(entry.cafe.name)
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.primary)
    }
    
    var notes: some View {
        Text(entry.cafe.notes[1])
            .font(.system(.subheadline, design: .rounded))
            .foregroundColor(.primary).opacity(0.8)
    }
    
    var image: some View {
        Rectangle()
            .overlay(
                Image(entry.cafe.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .aspectRatio(1, contentMode: .fit)
            .clipShape(ContainerRelativeShape())
    }
    
    var body: some View {
        ZStack {
            switch widgetFamily {
            case .systemSmall:
                VStack(alignment: .leading, spacing: 10) {
                    image
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    titleShort
                }
                .padding()
            case .systemMedium:
                HStack(alignment: .top, spacing: 10) {
                    image
                    VStack(alignment: .leading) {
                        titleLong
                            .padding(.bottom, 2)
                        notes
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityElement(children: .combine)
                }
                .padding()
            case .systemLarge:
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        image
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                WeekdayHours(cafe: entry.cafe, hoursIndex: 0, workday: "Mo")
                                WeekdayHours(cafe: entry.cafe, hoursIndex: 1, workday: "Di")
                                WeekdayHours(cafe: entry.cafe, hoursIndex: 2, workday: "Mi")
                                WeekdayHours(cafe: entry.cafe, hoursIndex: 3, workday: "Do")
                                WeekdayHours(cafe: entry.cafe, hoursIndex: 4, workday: "Fr")
                                WeekdayHours(cafe: entry.cafe, hoursIndex: 5, workday: "Sa")
                                WeekdayHours(cafe: entry.cafe, hoursIndex: 6, workday: "So")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack(alignment: .leading) {
                        titleLong
                            .padding(.bottom, 2)
                        notes
                    }
                }
                .padding()
            @unknown default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}



struct KOFFII_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KOFFII_WidgetEntryView(entry: KOFFII_Widget.Entry(date: Date(), cafe: topThreeOfTheMonth[0], image: Image(topThreeOfTheMonth[0].name)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            KOFFII_WidgetEntryView(entry: KOFFII_Widget.Entry(date: Date(), cafe: topThreeOfTheMonth[0], image: Image(topThreeOfTheMonth[0].name)))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            KOFFII_WidgetEntryView(entry: KOFFII_Widget.Entry(date: Date(), cafe: topThreeOfTheMonth[0], image: Image(topThreeOfTheMonth[0].name)))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
