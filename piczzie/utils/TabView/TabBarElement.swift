import SwiftUI

// 1
struct TabBarElementItem {
    var title: String
    var named: String
}

// 2
protocol TabBarElementView: View {
    associatedtype Content
    
    var content: Content { get set }
    var tabBarElementItem: TabBarElementItem { get set }
}


struct TabBarElement: TabBarElementView { // 1
    internal var content: AnyView // 2
    
    var tabBarElementItem: TabBarElementItem
    
    init<Content: View>(tabBarElementItem: TabBarElementItem, // 3
        @ViewBuilder _ content: () -> Content) { // 4
        self.tabBarElementItem = tabBarElementItem
        self.content = AnyView(content()) // 5
    }
    
    var body: some View { self.content } // 6
}


struct TabBarElement_Previews: PreviewProvider {
    static var previews: some View {
        TabBarElement(tabBarElementItem: .init(title: "Test",
                                               named: "house.fill")) {
                                                Text("Hello, world!")
        }
    }
}

