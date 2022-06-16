//https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension

import WidgetKit
import SwiftUI
import Intents

@main
struct KOFFII_Widget: Widget {
    let kind: String = "KOFFII_Widget"
    
    var body: some WidgetConfiguration {
        ///StaticConfiguration(non-userconfigurable) vs IntentConfiguration(userconfigurable)
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            KOFFII_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

///  Provider: An object conforming to TimelineProvider that produces a timeline telling WidgetKit when to render the widget. A timeline contains a custom TimelineEntry type that you define.
extension KOFFII_Widget {
    
    struct Provider: TimelineProvider {
        
        typealias Entry = KOFFII_Widget.Entry
        
        ///When WidgetKit displays your widget for the first time, it renders the widget’s view as a placeholder.
        func placeholder(in context: Context) -> Entry {
            Entry(date: Date(), model: CoffeeDetailViewModel(coffee: discoverCafes[0].coffee), image: Image(discoverCafes[0].name))
        }
        
        ///To show your widget in the widget gallery, WidgetKit asks the provider for a preview snapshot.
        func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
            let entry = Entry(date: Date(), model: CoffeeDetailViewModel(coffee: discoverCafes[1].coffee), image: Image(discoverCafes[0].name))
            completion(entry)
        }
        
        ///https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date
        func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
            var entries: [Entry] = []
            
            let currentDate = Date()
            for index in 0..<discoverCafes.count {
                let entryDate = Calendar.current.date(byAdding: .hour, value: index, to: currentDate)!
                let entry = Entry(date: entryDate, model: CoffeeDetailViewModel(coffee: discoverCafes[index].coffee), image: Image(discoverCafes[index].name))
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
        var model: CoffeeDetailViewModel
        var image: Image
    }
}

struct KOFFII_WidgetEntryView : View {
    
    var entry: KOFFII_Widget.Provider.Entry
    
    @Environment(\.widgetFamily) private var widgetFamily
    
    var titleLong: some View {
        Text("Ümit´s Empfehlung: \(entry.model.name)")
            .font(.system(.headline, design: .default))
            .foregroundColor(.primary)
    }
    
    var titleShort: some View {
        Text(entry.model.name)
            .font(.system(.headline, design: .default))
            .foregroundColor(.primary)
    }
    
    var notes: some View {
        Text(entry.model.notesBody)
            .font(.system(.subheadline, design: .default))
            .foregroundColor(.primary).opacity(0.8)
    }
    
    var image: some View {
        Rectangle()
            .overlay(
                Image(entry.model.name)
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
                                WeekdayHours(day: "Mo", hours: entry.model.hoursMo)
                                WeekdayHours(day: "Di", hours: entry.model.hoursDi)
                                WeekdayHours(day: "Mi", hours: entry.model.hoursMi)
                                WeekdayHours(day: "Do", hours: entry.model.hoursDo)
                                WeekdayHours(day: "Fr", hours: entry.model.hoursFr)
                                WeekdayHours(day: "Sa", hours: entry.model.hoursSa)
                                WeekdayHours(day: "So", hours: entry.model.hoursSo)

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
            KOFFII_WidgetEntryView(entry: KOFFII_Widget.Entry(date: Date(), model: CoffeeDetailViewModel(coffee: discoverCafes[0].coffee) , image: Image(discoverCafes[0].name)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.colorScheme, .dark)
            KOFFII_WidgetEntryView(entry: KOFFII_Widget.Entry(date: Date(), model: CoffeeDetailViewModel(coffee: discoverCafes[0].coffee), image: Image(discoverCafes[0].name)))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .environment(\.colorScheme, .dark)
            KOFFII_WidgetEntryView(entry: KOFFII_Widget.Entry(date: Date(), model: CoffeeDetailViewModel(coffee: discoverCafes[0].coffee), image: Image(discoverCafes[0].name)))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .environment(\.colorScheme, .dark)
        }
        
    }
}
