import SwiftUI

struct DiscoverView: View {
    @State private var showFirstText = true
    @State private var firstTextOpacity = 1.0
    @State private var secondTextOpacity = 0.0

    var body: some View {
        ZStack {
            // Background image
            Image("img1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Text overlays
            ZStack {
                // First Quote
                VStack(spacing: 4) {
                    (
                        Text("fashion is ")
                            .font(.system(size: 20, weight: .thin, design: .serif)) +
                        Text("how")
                            .italic()
                            .font(.system(size: 20, weight: .thin, design: .serif))
                    )
                    (
                        Text("we tell the world")
                            .font(.system(size: 20, weight: .thin, design: .serif))
                    )
                    (
                        Text("what we ")
                            .font(.system(size: 20, weight: .thin, design: .serif)) +
                        Text("can't say out ")
                            .italic()
                            .font(.system(size: 20, weight: .thin, design: .serif)) +
                        Text("loud")
                            .italic()
                            .font(.system(size: 20, weight: .thin, design: .serif))
                    )
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .shadow(radius: 2)
                .opacity(firstTextOpacity)

                // Second Quote
                VStack(spacing: 4) {
                    (
                        Text("this is ")
                            .font(.system(size: 20, weight: .thin, design: .serif)) +
                        Text("placeholder")
                            .italic()
                            .font(.system(size: 20, weight: .bold, design: .serif))
                    )
                    (
                        Text("for now —")
                            .font(.system(size: 20, weight: .thin, design: .serif))
                    )
                    (
                        Text("but you ")
                            .font(.system(size: 20, weight: .thin, design: .serif)) +
                        Text("get the")
                            .italic()
                            .font(.system(size: 20, weight: .thin, design: .serif)) +
                        Text(" idea.")
                            .italic()
                            .font(.system(size: 20, weight: .thin, design: .serif))
                    )
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .shadow(radius: 2)
                .opacity(secondTextOpacity)
            }
            .padding()
        }
        .onAppear {
            // Fade out first text and fade in second after 3 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 1.5)) {
                    firstTextOpacity = 0.0
                    secondTextOpacity = 1.0
                }
            }
        }
    }
}
