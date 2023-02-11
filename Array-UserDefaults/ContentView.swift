
import SwiftUI

struct ContentView: View {
    @State var name = ""
    var body: some View {
        VStack {
            Text(name)
            TextField("名前を入力", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 150)
            Button(action: {
                setName(name: name)
            }) {
                Text("保存")
            }
        }
        .onAppear() {
            name = updateName()
        }
    }
    func setName(name: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(name, forKey: "nameKey")
    }
    
    func updateName() -> String {
        let userDefaults = UserDefaults.standard
        let name = userDefaults.string(forKey: "nameKey") ?? ""
        return name
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
