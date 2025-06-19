import Foundation

/// Constants used throughout the application
struct Constants {

    /// API Keys for various services
    struct APIKeys {
        /// Airtable API Key - for authentication
        static let airtableAPIKey = "patgY9PM33o3TY6yV.cb85e5d847c493891b1fc363bb173b50e6e257f5ee3c38a28ea30bd26a5fa298"

        /// Airtable Base ID - the identifier for your Airtable base
        static let airtableBaseID = "appYnRqzu5db6Rd4A"
        /// Airtable Coffee Table ID
        static let airtableCoffeeTableKey = "tblbQqYpfFt97BZQZ"

        /// Google Maps API Key
        static let googleMaps = "YOUR_GOOGLE_MAPS_API_KEY"

        /// Weather API Key
        static let weatherAPI = "YOUR_WEATHER_API_KEY"
    }

    /// URLs for API endpoints
    struct URLs {
        /// Base URL for weather API
        static let weatherBaseURL = "https://api.weatherservice.com"

        /// Base URL for coffee database
        static let coffeeDBBaseURL = "https://api.coffeedb.com"
    }

    /// Application-wide settings
    struct AppSettings {
        /// Default map region radius in meters
        static let defaultMapRadius: Double = 1000.0

        /// Maximum number of coffee shops to display at once
        static let maxCoffeeShops = 50

        /// Cache expiration time in seconds
        static let cacheExpirationTime: TimeInterval = 3600 // 1 hour
    }

    /// UI related constants
    struct UI {
        /// Standard corner radius for cards
        static let standardCornerRadius: CGFloat = 12.0

        /// Standard padding for views
        static let standardPadding: CGFloat = 16.0

        /// Animation duration for transitions
        static let animationDuration: Double = 0.3
    }
}
