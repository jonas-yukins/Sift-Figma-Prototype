import SwiftUI

// — Enum for tabs —
enum Tab {
    case home, discover, brands, collection, you
}

struct MainView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack(spacing: 0) {
            // Main Content
            Group {
                NavigationStack {
                    switch selectedTab {
                    case .home:
                        ContentView()
                    case .discover:
                        DiscoverView()
                    case .brands:
                        BrandsView()
                    case .collection:
                        CollectionView()
                    case .you:
                        YouView()
                    }
                }
            }

            // Bottom Nav
            HStack {
                Spacer()
                Button("home") { selectedTab = .home }
                Spacer()
                Button("discover") { selectedTab = .discover }
                Spacer()
                Button("brands") { selectedTab = .brands }
                Spacer()
                Button("collection") { selectedTab = .collection }
                Spacer()
                Button("you") { selectedTab = .you }
                Spacer()
            }
            .font(.caption)
            .foregroundColor(.gray)
            .background(.opacity(0))
            .padding(.vertical, 8)
        }
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 24) {

                // — Header —
                VStack(spacing: 8) {
                    (
                        Text("what are ")
                            .font(.system(size: 20, weight: .thin, design: .serif)) +
                        Text("you")
                            .font(.system(size: 20, weight: .bold, design: .serif))
                    )
                    .multilineTextAlignment(.center)

                    Text("dressing for today?")
                        .font(.system(size: 20, weight: .thin, design: .serif))
                        .multilineTextAlignment(.center)
                }
                .padding(.top)

                // — Image Links —
                VStack(spacing: 40) {
                    ImageLink(imageName: "img1",
                              title: "discover a feeling",
                              subtitle: "shop by mood, not item",
                              destination: DiscoverView())
                    ImageLink(imageName: "img2",
                              title: "see the exhibit",
                              subtitle: "this month: the art of becoming",
                              destination: DetailView(title: "Look 2"))
                    ImageLink(imageName: "img3",
                              title: "browse everything",
                              subtitle: "everything we carry, for every version of you",
                              destination: DetailView(title: "Look 3"))
                }
                .padding()

                // — Separator —
                Rectangle()
                    .fill(Color.black.opacity(0.4))
                    .frame(width: 200, height: 1)
                    .padding(.top, 20)

                // — About Sift —
                VStack(alignment: .leading, spacing: 8) {
                    Text("about sift")
                        .font(.system(size: 16, weight: .regular, design: .serif))
                        .italic()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()

                    Text("""
                    sift is emotional commerce.  
                    we don’t sort by trend or price — we curate by feeling.  
                    every product carries a mood. every brand is a universe.  
                    this isn’t a feed. it’s a framework for self-recognition.  
                    built to feel. designed to last.
                    """)
                        .font(.system(size: 11, weight: .thin, design: .serif))
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(6)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal)
                .padding(10)
            }
        }
    }
}

struct ImageLink<Destination: View>: View {
    let imageName: String
    let title: String
    let subtitle: String
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(20.0)
                    .frame(height: 175)
                    .clipped()
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                VStack {
                    Text(title)
                        .font(.title2)
                        .italic()
                        .foregroundColor(.white)
                        .shadow(radius: 4)

                    Text(subtitle)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.85))
                        .shadow(radius: 2)
                }
            }
        }
        .buttonStyle(PlainButtonStyle()) // removes tap animation
    }
}

struct DetailView: View {
    let title: String
    var body: some View {
        Text("Welcome to \(title)")
            .font(.largeTitle)
    }
}

struct BrandsView: View {
    var body: some View {
        Text("Brands")
    }
}

struct CollectionView: View {
    var body: some View {
        Text("Collection")
    }
}

struct YouView: View {
    var body: some View {
        Text("You")
    }
}

#Preview {
    MainView()
}
