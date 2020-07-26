import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    @IBOutlet var tabView: NSTabView!
    @IBOutlet var view1: NSView!
    @IBOutlet var view2: NSView!
    @IBOutlet var logsTextField: NSTextField!
    var tabViewController: NSTabViewController? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.tabViewController = NSTabViewController()
        if let tabViewController = self.tabViewController {
            tabViewController.tabView = self.tabView;
        }
        
        self.addTabViewItem(view: view1,
                            label: "Label Uno",
                            identifier: "Identifier Uno")
        self.addTabViewItem(view: view2,
                            label: "Label Dos",
                            identifier: "Identifier Dos")
        
        let log = String(format:"• tab view controller's tab view items: \(String(describing: self.tabViewController?.tabViewItems))\n\n• tab view's tab view items: \(String(describing: self.tabView?.tabViewItems))")
        
        self.tabView .display() // does not do any good
        self.logsTextField.stringValue = log
    }
    
    func addTabViewItem(view: NSView, label: String!, identifier: String!) {
        let childViewController = NSViewController();
        childViewController.view = view;
        self.tabViewController?.addChild(childViewController)
        if let tabViewItem = self.tabViewController?.tabViewItem(for: childViewController) {
            tabViewItem.identifier = identifier
            tabViewItem.label = label;
            tabViewItem.view = childViewController.view;
        }
    }
}
