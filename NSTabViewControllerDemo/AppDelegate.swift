import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    @IBOutlet var tabView: NSTabView!
    @IBOutlet var view1: NSView!
    @IBOutlet var view2: NSView!
    var tabViewController: NSTabViewController? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.tabViewController = NSTabViewController()
        if let tabViewController = self.tabViewController {
            /* The following two lines seem redundant, but they are not.
             Both lines are necessary or the tab view controller will not
             propagate its tab view items into its tab view. */
            tabViewController.tabView = self.tabView;
            tabViewController.view = self.tabView
        }
        
        self.addTabViewItem(view: view1,
                            label: "Label Uno",
                            identifier: "Identifier Uno")
        self.addTabViewItem(view: view2,
                            label: "Label Dos",
                            identifier: "Identifier Dos")
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
