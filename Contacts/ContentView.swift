import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("My Favorite Contacts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.bottom, 8)

            NombresView()
        }
        .padding()
        .background(
            LinearGradient(colors: [.blue.opacity(0.2), .purple.opacity(0.2)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
        )
    }
}

struct Contacto: Identifiable {
    let id = UUID()
    let nombre: String
    let telefono: String
    let emoji: String
}

struct NombresView: View {
    let personas = [
        Contacto(nombre: "Benjamín", telefono: "55 6347 0839", emoji: "👽"),
        Contacto(nombre: "Pedro", telefono: "55 4882 2222", emoji: "🤖"),
        Contacto(nombre: "Alfonso", telefono: "56 5648 0622", emoji: "🤩"),
        Contacto(nombre: "Sofía", telefono: "55 1122 3344", emoji: "👩‍💻"),
        Contacto(nombre: "Luis", telefono: "55 7788 9900", emoji: "🧑‍🚀"),
        Contacto(nombre: "María", telefono: "55 6677 8899", emoji: "🎨"),
        Contacto(nombre: "Carlos", telefono: "55 4455 6677", emoji: "🎮")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(personas) { persona in
                    HStack(spacing: 16) {
                        Text(persona.emoji)
                            .font(.system(size: 50))
                            .shadow(radius: 3)

                        VStack(alignment: .leading, spacing: 6) {
                            Text(persona.nombre)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                            Text(persona.telefono)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(
                                LinearGradient(colors: [.white, .blue.opacity(0.1)],
                                               startPoint: .top,
                                               endPoint: .bottom)
                            )
                    )
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
