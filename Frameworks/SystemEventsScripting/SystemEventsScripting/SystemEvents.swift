import AppKit
import ScriptingBridge

@objc public protocol SBObjectProtocol: NSObjectProtocol {
    func get() -> AnyObject!
}

@objc public protocol SBApplicationProtocol: SBObjectProtocol {
    func activate()
    var delegate: SBApplicationDelegate! { get set }
}

// MARK: SystemEventsApplication
@objc public protocol SystemEventsApplication: SBApplicationProtocol {
    optional func documents() -> SBElementArray
    optional func windows() -> SBElementArray
    optional var name: String { get } // The name of the application.
    optional var frontmost: Bool { get } // Is this the active application?
    optional var version: String { get } // The version number of the application.
    optional func open(x: AnyObject!) -> AnyObject // Open a document.
    optional func print(x: AnyObject!, withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func quitSaving(saving: SystemEventsSaveOptions) // Quit the application.
    optional func exists(x: AnyObject!) -> Bool // Verify that an object exists.
    optional func abortTransaction() // Discard the results of a bounded update session with one or more files.
    optional func beginTransaction() -> Int // Begin a bounded update session with one or more files.
    optional func endTransaction() // Apply the results of a bounded update session with one or more files.
    optional func move(x: AnyObject!, to: AnyObject!) -> AnyObject // Move disk item(s) to a new location.
    optional func logOut() // Log out the current user
    optional func restartStateSavingPreference(stateSavingPreference: Bool) // Restart the computer
    optional func shutDownStateSavingPreference(stateSavingPreference: Bool) // Shut Down the computer
    optional func sleep() // Put the computer to sleep
    optional func clickAt(at: [AnyObject]!) -> AnyObject // cause the target process to behave as if the UI element were clicked
    optional func keyCode(x: AnyObject!, using: AnyObject!) // cause the target process to behave as if key codes were entered
    optional func keystroke(x: String!, using: AnyObject!) // cause the target process to behave as if keystrokes were entered
    optional var quitDelay: Int { get set } // the time in seconds the application will idle before quitting; if set to zero, idle time will not cause the application to quit
    optional var scriptMenuEnabled: Bool { get } // Is the Script menu installed in the menu bar?
    optional func users() -> SBElementArray
    optional var currentUser: SystemEventsUser { get } // the currently logged in user
    optional var appearancePreferences: SystemEventsAppearancePreferencesObject { get set } // a collection of appearance preferences
    optional var CDAndDVDPreferences: SystemEventsCDAndDVDPreferencesObject { get set } // the preferences for the current user when a CD or DVD is inserted
    optional func desktops() -> SBElementArray
    optional var currentDesktop: SystemEventsDesktop { get } // the primary desktop
    optional var dockPreferences: SystemEventsDockPreferencesObject { get set } // the preferences for the current user's dock
    optional func loginItems() -> SBElementArray
    optional var networkPreferences: SystemEventsNetworkPreferencesObject { get set } // the preferences for the current user's network
    optional func screenSavers() -> SBElementArray
    optional var currentScreenSaver: SystemEventsScreenSaver { get set } // the currently selected screen saver
    optional var screenSaverPreferences: SystemEventsScreenSaverPreferencesObject { get set } // the preferences common to all screen savers
    optional func audioDatas() -> SBElementArray
    optional func audioFiles() -> SBElementArray
    optional var securityPreferences: SystemEventsSecurityPreferencesObject { get set } // a collection of security preferences
    optional func aliases() -> SBElementArray
    optional func disks() -> SBElementArray
    optional func diskItems() -> SBElementArray
    optional func domains() -> SBElementArray
    optional func files() -> SBElementArray
    optional func filePackages() -> SBElementArray
    optional func folders() -> SBElementArray
    optional var applicationSupportFolder: SystemEventsFolder { get } // The Application Support folder
    optional var applicationsFolder: SystemEventsFolder { get } // The user's Applications folder
    optional var ClassicDomain: SystemEventsClassicDomainObject { get } // the collection of folders belonging to the Classic System
    optional var desktopFolder: SystemEventsFolder { get } // The user's Desktop folder
    optional var desktopPicturesFolder: SystemEventsFolder { get } // The Desktop Pictures folder
    optional var documentsFolder: SystemEventsFolder { get } // The user's Documents folder
    optional var downloadsFolder: SystemEventsFolder { get } // The user's Downloads folder
    optional var favoritesFolder: SystemEventsFolder { get } // The user's Favorites folder
    optional var FolderActionScriptsFolder: SystemEventsFolder { get } // The user's Folder Action Scripts folder
    optional var fontsFolder: SystemEventsFolder { get } // The Fonts folder
    optional var homeFolder: SystemEventsFolder { get } // The Home folder of the currently logged in user
    optional var libraryFolder: SystemEventsFolder { get } // The Library folder
    optional var localDomain: SystemEventsLocalDomainObject { get } // the collection of folders residing on the Local machine
    optional var moviesFolder: SystemEventsFolder { get } // The user's Movies folder
    optional var musicFolder: SystemEventsFolder { get } // The user's Music folder
    optional var networkDomain: SystemEventsNetworkDomainObject { get } // the collection of folders residing on the Network
    optional var picturesFolder: SystemEventsFolder { get } // The user's Pictures folder
    optional var preferencesFolder: SystemEventsFolder { get } // The user's Preferences folder
    optional var publicFolder: SystemEventsFolder { get } // The user's Public folder
    optional var scriptingAdditionsFolder: SystemEventsFolder { get } // The Scripting Additions folder
    optional var scriptsFolder: SystemEventsFolder { get } // The user's Scripts folder
    optional var sharedDocumentsFolder: SystemEventsFolder { get } // The Shared Documents folder
    optional var sitesFolder: SystemEventsFolder { get } // The user's Sites folder
    optional var speakableItemsFolder: SystemEventsFolder { get } // The Speakable Items folder
    optional var startupDisk: SystemEventsDisk { get } // the disk from which Mac OS X was loaded
    optional var systemDomain: SystemEventsSystemDomainObject { get } // the collection of folders belonging to the System
    optional var temporaryItemsFolder: SystemEventsFolder { get } // The Temporary Items folder
    optional var trash: SystemEventsFolder { get } // The user's Trash folder
    optional var userDomain: SystemEventsUserDomainObject { get } // the collection of folders belonging to the User
    optional var utilitiesFolder: SystemEventsFolder { get } // The Utilities folder
    optional var workflowsFolder: SystemEventsFolder { get } // The Automator Workflows folder
    optional func folderActions() -> SBElementArray
    optional var folderActionsEnabled: Bool { get set } // Are Folder Actions currently being processed?
    optional func movieDatas() -> SBElementArray
    optional func movieFiles() -> SBElementArray
    optional func applicationProcesses() -> SBElementArray
    optional func deskAccessoryProcesses() -> SBElementArray
    optional func processes() -> SBElementArray
    optional func UIElements() -> SBElementArray
    optional var UIElementsEnabled: Bool { get } // Are UI element events currently being processed?
    optional func propertyListFiles() -> SBElementArray
    optional func propertyListItems() -> SBElementArray
    optional func QuickTimeDatas() -> SBElementArray
    optional func QuickTimeFiles() -> SBElementArray
    optional func XMLDatas() -> SBElementArray
    optional func XMLFiles() -> SBElementArray
    optional var scriptingDefinition: SystemEventsScriptingDefinitionObject { get } // The scripting definition of the System Events application
}
extension SBApplication: SystemEventsApplication {}

// MARK: SystemEventsDocument
@objc public protocol SystemEventsDocument: SBObjectProtocol {
    optional var name: String { get } // Its name.
    optional var modified: Bool { get } // Has it been modified since the last save?
    optional var file: SystemEventsFile { get } // Its location on disk, if it has one.
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsDocument {}

// MARK: SystemEventsWindow
@objc public protocol SystemEventsWindow: SBObjectProtocol {
    optional var name: String { get } // The title of the window.
    optional func id() -> Int // The unique identifier of the window.
    optional var index: Int { get set } // The index of the window, ordered front to back.
    optional var bounds: NSRect { get set } // The bounding rectangle of the window.
    optional var closeable: Bool { get } // Does the window have a close button?
    optional var miniaturizable: Bool { get } // Does the window have a minimize button?
    optional var miniaturized: Bool { get set } // Is the window minimized right now?
    optional var resizable: Bool { get } // Can the window be resized?
    optional var visible: Bool { get set } // Is the window visible right now?
    optional var zoomable: Bool { get } // Does the window have a zoom button?
    optional var zoomed: Bool { get set } // Is the window zoomed right now?
    optional var document: SystemEventsDocument { get } // The document whose contents are displayed in the window.
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
    optional func actions() -> SBElementArray
    optional func attributes() -> SBElementArray
    optional func browsers() -> SBElementArray
    optional func busyIndicators() -> SBElementArray
    optional func buttons() -> SBElementArray
    optional func checkboxes() -> SBElementArray
    optional func colorWells() -> SBElementArray
    optional func comboBoxes() -> SBElementArray
    optional func drawers() -> SBElementArray
    optional func groups() -> SBElementArray
    optional func growAreas() -> SBElementArray
    optional func images() -> SBElementArray
    optional func incrementors() -> SBElementArray
    optional func lists() -> SBElementArray
    optional func menuButtons() -> SBElementArray
    optional func outlines() -> SBElementArray
    optional func popOvers() -> SBElementArray
    optional func popUpButtons() -> SBElementArray
    optional func progressIndicators() -> SBElementArray
    optional func radioButtons() -> SBElementArray
    optional func radioGroups() -> SBElementArray
    optional func relevanceIndicators() -> SBElementArray
    optional func scrollAreas() -> SBElementArray
    optional func scrollBars() -> SBElementArray
    optional func sheets() -> SBElementArray
    optional func sliders() -> SBElementArray
    optional func splitters() -> SBElementArray
    optional func splitterGroups() -> SBElementArray
    optional func staticTexts() -> SBElementArray
    optional func tabGroups() -> SBElementArray
    optional func tables() -> SBElementArray
    optional func textAreas() -> SBElementArray
    optional func textFields() -> SBElementArray
    optional func toolbars() -> SBElementArray
    optional func UIElements() -> SBElementArray
    optional var accessibilityDescription: AnyObject { get } // a more complete description of the window and its capabilities
    optional var objectDescription: AnyObject { get } // the accessibility description, if available; otherwise, the role description
    optional var enabled: AnyObject { get } // Is the window enabled? ( Does it accept clicks? )
    optional var entireContents: [AnyObject] { get } // a list of every UI element contained in this window and its child UI elements, to the limits of the tree
    optional var focused: AnyObject { get set } // Is the focus on this window?
    optional var help: AnyObject { get } // an elaborate description of the window and its capabilities
    optional var maximumValue: AnyObject { get } // the maximum value that the UI element can take on
    optional var minimumValue: AnyObject { get } // the minimum value that the UI element can take on
    optional var orientation: AnyObject { get } // the orientation of the window
    optional var position: AnyObject { get set } // the position of the window
    optional var role: String { get } // an encoded description of the window and its capabilities
    optional var roleDescription: String { get } // a more complete description of the window's role
    optional var selected: AnyObject { get set } // Is the window selected?
    optional var size: AnyObject { get set } // the size of the window
    optional var subrole: AnyObject { get } // an encoded description of the window and its capabilities
    optional var title: String { get } // the title of the window as it appears on the screen
    optional var value: AnyObject { get set } // the current value of the window
}
extension SBObject: SystemEventsWindow {}

// MARK: SystemEventsUser
@objc public protocol SystemEventsUser: SBObjectProtocol {
    optional var fullName: String { get } // user's full name
    optional var homeDirectory: AnyObject { get } // path to user's home directory
    optional var name: String { get } // user's short name
    optional var picturePath: AnyObject { get set } // path to user's picture. Can be set for current user only!
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsUser {}

// MARK: SystemEventsAppearancePreferencesObject
@objc public protocol SystemEventsAppearancePreferencesObject: SBObjectProtocol {
    optional var appearance: SystemEventsAppearances { get set } // the overall look of buttons, menus and windows
    optional var fontSmoothing: Bool { get set } // Is font smoothing on?
    optional var fontSmoothingStyle: SystemEventsFontSmoothingStyles { get set } // the method used for smoothing fonts
    optional var highlightColor: AnyObject { get set } // color used for hightlighting selected text and lists
    optional var recentApplicationsLimit: Int { get set } // the number of recent applications to track
    optional var recentDocumentsLimit: Int { get set } // the number of recent documents to track
    optional var recentServersLimit: Int { get set } // the number of recent servers to track
    optional var scrollBarAction: SystemEventsScrollPageBehaviors { get set } // the action performed by clicking the scroll bar
    optional var smoothScrolling: Bool { get set } // Is smooth scrolling used?
    optional var darkMode: Bool { get set } // use dark menu bar and dock
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsAppearancePreferencesObject {}

// MARK: SystemEventsCDAndDVDPreferencesObject
@objc public protocol SystemEventsCDAndDVDPreferencesObject: SBObjectProtocol {
    optional var blankCD: SystemEventsInsertionPreference { get } // the blank CD insertion preference
    optional var blankDVD: SystemEventsInsertionPreference { get } // the blank DVD insertion preference
    optional var blankBD: SystemEventsInsertionPreference { get } // the blank BD insertion preference
    optional var musicCD: SystemEventsInsertionPreference { get } // the music CD insertion preference
    optional var pictureCD: SystemEventsInsertionPreference { get } // the picture CD insertion preference
    optional var videoDVD: SystemEventsInsertionPreference { get } // the video DVD insertion preference
    optional var videoBD: SystemEventsInsertionPreference { get } // the video BD insertion preference
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsCDAndDVDPreferencesObject {}

// MARK: SystemEventsInsertionPreference
@objc public protocol SystemEventsInsertionPreference: SBObjectProtocol {
    optional var customApplication: AnyObject { get set } // application to launch or activate on the insertion of media
    optional var customScript: AnyObject { get set } // AppleScript to launch or activate on the insertion of media
    optional var insertionAction: SystemEventsDhac { get set } // action to perform on media insertion
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsInsertionPreference {}

// MARK: SystemEventsDesktop
@objc public protocol SystemEventsDesktop: SBObjectProtocol {
    optional var name: String { get } // name of the desktop
    optional func id() -> Int // unique identifier of the desktop
    optional var changeInterval: Double { get set } // number of seconds to wait between changing the desktop picture
    optional var displayName: String { get } // name of display on which this desktop appears
    optional var picture: AnyObject { get set } // path to file used as desktop picture
    optional var pictureRotation: Int { get set } // never, using interval, using login, after sleep
    optional var picturesFolder: AnyObject { get set } // path to folder containing pictures for changing desktop background
    optional var randomOrder: Bool { get set } // turn on for random ordering of changing desktop pictures
    optional var translucentMenuBar: Bool { get set } // indicates whether the menu bar is translucent
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsDesktop {}

// MARK: SystemEventsDockPreferencesObject
@objc public protocol SystemEventsDockPreferencesObject: SBObjectProtocol {
    optional var animate: Bool { get set } // is the animation of opening applications on or off?
    optional var autohide: Bool { get set } // is autohiding the dock on or off?
    optional var dockSize: Double { get set } // size/height of the items (between 0.0 (minimum) and 1.0 (maximum))
    optional var magnification: Bool { get set } // is magnification on or off?
    optional var magnificationSize: Double { get set } // maximum magnification size when magnification is on (between 0.0 (minimum) and 1.0 (maximum))
    optional var minimizeEffect: SystemEventsDpef { get set } // minimization effect
    optional var screenEdge: SystemEventsDpls { get set } // location on screen
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsDockPreferencesObject {}

// MARK: SystemEventsLoginItem
@objc public protocol SystemEventsLoginItem: SBObjectProtocol {
    optional var hidden: Bool { get set } // Is the Login Item hidden when launched?
    optional var kind: String { get } // the file type of the Login Item
    optional var name: String { get } // the name of the Login Item
    optional var path: String { get } // the file system path to the Login Item
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsLoginItem {}

// MARK: SystemEventsConfiguration
@objc public protocol SystemEventsConfiguration: SBObjectProtocol {
    optional var accountName: String { get set } // the name used to authenticate
    optional var connected: Bool { get } // Is the configuration connected?
    optional func id() -> String // the unique identifier for the configuration
    optional var name: String { get } // the name of the configuration
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
    optional func connect() -> SystemEventsConfiguration // connect a configuration or service
    optional func disconnect() -> SystemEventsConfiguration // disconnect a configuration or service
}
extension SBObject: SystemEventsConfiguration {}

// MARK: SystemEventsInterface
@objc public protocol SystemEventsInterface: SBObjectProtocol {
    optional var automatic: Bool { get set } // configure the interface speed, duplex, and mtu automatically?
    optional var duplex: String { get set } // the duplex setting  half | full | full with flow control
    optional func id() -> String // the unique identifier for the interface
    optional var kind: String { get } // the type of interface
    optional var MACAddress: String { get } // the MAC address for the interface
    optional var mtu: Int { get set } // the packet size
    optional var name: String { get } // the name of the interface
    optional var speed: Int { get set } // ethernet speed 10 | 100 | 1000
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsInterface {}

// MARK: SystemEventsLocation
@objc public protocol SystemEventsLocation: SBObjectProtocol {
    optional func services() -> SBElementArray
    optional func id() -> String // the unique identifier for the location
    optional var name: String { get set } // the name of the location
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsLocation {}

// MARK: SystemEventsNetworkPreferencesObject
@objc public protocol SystemEventsNetworkPreferencesObject: SBObjectProtocol {
    optional func interfaces() -> SBElementArray
    optional func locations() -> SBElementArray
    optional func services() -> SBElementArray
    optional var currentLocation: SystemEventsLocation { get set } // the current location
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsNetworkPreferencesObject {}

// MARK: SystemEventsService
@objc public protocol SystemEventsService: SBObjectProtocol {
    optional func configurations() -> SBElementArray
    optional var active: Bool { get } // Is the service active?
    optional var currentConfiguration: SystemEventsConfiguration { get set } // the currently selected configuration
    optional func id() -> String // the unique identifier for the service
    optional var interface: SystemEventsInterface { get } // the interface the service is built on
    optional var kind: Int { get } // the type of service
    optional var name: String { get set } // the name of the service
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
    optional func connect() -> SystemEventsConfiguration // connect a configuration or service
    optional func disconnect() -> SystemEventsConfiguration // disconnect a configuration or service
}
extension SBObject: SystemEventsService {}

// MARK: SystemEventsScreenSaver
@objc public protocol SystemEventsScreenSaver: SBObjectProtocol {
    optional var displayedName: String { get } // name of the screen saver module as displayed to the user
    optional var name: String { get } // name of the screen saver module to be displayed
    optional var path: SystemEventsAlias { get } // path to the screen saver module
    optional var pictureDisplayStyle: String { get set } // effect to use when displaying picture-based screen savers (slideshow, collage, or mosaic)
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
    optional func start() // start the screen saver
    optional func stop() // stop the screen saver
}
extension SBObject: SystemEventsScreenSaver {}

// MARK: SystemEventsScreenSaverPreferencesObject
@objc public protocol SystemEventsScreenSaverPreferencesObject: SBObjectProtocol {
    optional var delayInterval: Int { get set } // number of seconds of idle time before the screen saver starts; zero for never
    optional var mainScreenOnly: Bool { get set } // should the screen saver be shown only on the main screen?
    optional var running: Bool { get } // is the screen saver running?
    optional var showClock: Bool { get set } // should a clock appear over the screen saver?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
    optional func start() // start the screen saver
    optional func stop() // stop the screen saver
}
extension SBObject: SystemEventsScreenSaverPreferencesObject {}

// MARK: SystemEventsSecurityPreferencesObject
@objc public protocol SystemEventsSecurityPreferencesObject: SBObjectProtocol {
    optional var automaticLogin: Bool { get set } // Is automatic login allowed?
    optional var logOutWhenInactive: Bool { get set } // Will the computer log out when inactive?
    optional var logOutWhenInactiveInterval: Int { get set } // The interval of inactivity after which the computer will log out
    optional var requirePasswordToUnlock: Bool { get set } // Is a password required to unlock secure preferences?
    optional var requirePasswordToWake: Bool { get set } // Is a password required to wake the computer from sleep or screen saver?
    optional var secureVirtualMemory: Bool { get set } // Is secure virtual memory being used?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsSecurityPreferencesObject {}

// MARK: SystemEventsDiskItem
@objc public protocol SystemEventsDiskItem: SBObjectProtocol {
    optional var busyStatus: Bool { get } // Is the disk item busy?
    optional var container: SystemEventsDiskItem { get } // the folder or disk which has this disk item as an element
    optional var creationDate: NSDate { get } // the date on which the disk item was created
    optional var displayedName: String { get } // the name of the disk item as displayed in the User Interface
    optional func id() -> String // the unique ID of the disk item
    optional var modificationDate: NSDate { get set } // the date on which the disk item was last modified
    optional var name: String { get set } // the name of the disk item
    optional var nameExtension: String { get } // the extension portion of the name
    optional var packageFolder: Bool { get } // Is the disk item a package?
    optional var path: String { get } // the file system path of the disk item
    optional var physicalSize: Int { get } // the actual space used by the disk item on disk
    optional var POSIXPath: String { get } // the POSIX file system path of the disk item
    optional var size: Int { get } // the logical size of the disk item
    optional var URL: String { get } // the URL of the disk item
    optional var visible: Bool { get set } // Is the disk item visible?
    optional var volume: String { get } // the volume on which the disk item resides
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsDiskItem {}

// MARK: SystemEventsAlias
@objc public protocol SystemEventsAlias: SystemEventsDiskItem {
    optional func aliases() -> SBElementArray
    optional func diskItems() -> SBElementArray
    optional func files() -> SBElementArray
    optional func filePackages() -> SBElementArray
    optional func folders() -> SBElementArray
    optional var creatorType: AnyObject { get set } // the OSType identifying the application that created the alias
    optional var defaultApplication: AnyObject { get set } // the application that will launch if the alias is opened
    optional var fileType: AnyObject { get set } // the OSType identifying the type of data contained in the alias
    optional var kind: String { get } // The kind of alias, as shown in Finder
    optional var productVersion: String { get } // the version of the product (visible at the top of the "Get Info" window)
    optional var shortVersion: String { get } // the short version of the application bundle referenced by the alias
    optional var stationery: Bool { get set } // Is the alias a stationery pad?
    optional var typeIdentifier: String { get } // The type identifier of the alias
    optional var version: String { get } // the version of the application bundle referenced by the alias (visible at the bottom of the "Get Info" window)
}
extension SBObject: SystemEventsAlias {}

// MARK: SystemEventsDisk
@objc public protocol SystemEventsDisk: SystemEventsDiskItem {
    optional func aliases() -> SBElementArray
    optional func diskItems() -> SBElementArray
    optional func files() -> SBElementArray
    optional func filePackages() -> SBElementArray
    optional func folders() -> SBElementArray
    optional var capacity: NSNumber { get } // the total number of bytes (free or used) on the disk
    optional var ejectable: Bool { get } // Can the media be ejected (floppies, CD's, and so on)?
    optional var format: SystemEventsEdfm { get } // the file system format of this disk
    optional var freeSpace: NSNumber { get } // the number of free bytes left on the disk
    optional var ignorePrivileges: Bool { get set } // Ignore permissions on this disk?
    optional var localVolume: Bool { get } // Is the media a local volume (as opposed to a file server)?
    optional var server: AnyObject { get } // the server on which the disk resides, AFP volumes only
    optional var startup: Bool { get } // Is this disk the boot disk?
    optional var zone: AnyObject { get } // the zone in which the disk's server resides, AFP volumes only
}
extension SBObject: SystemEventsDisk {}

// MARK: SystemEventsDomain
@objc public protocol SystemEventsDomain: SBObjectProtocol {
    optional func folders() -> SBElementArray
    optional var applicationSupportFolder: SystemEventsFolder { get } // The Application Support folder
    optional var applicationsFolder: SystemEventsFolder { get } // The Applications folder
    optional var desktopPicturesFolder: SystemEventsFolder { get } // The Desktop Pictures folder
    optional var FolderActionScriptsFolder: SystemEventsFolder { get } // The Folder Action Scripts folder
    optional var fontsFolder: SystemEventsFolder { get } // The Fonts folder
    optional func id() -> String // the unique identifier of the domain
    optional var libraryFolder: SystemEventsFolder { get } // The Library folder
    optional var name: String { get } // the name of the domain
    optional var preferencesFolder: SystemEventsFolder { get } // The Preferences folder
    optional var scriptingAdditionsFolder: SystemEventsFolder { get } // The Scripting Additions folder
    optional var scriptsFolder: SystemEventsFolder { get } // The Scripts folder
    optional var sharedDocumentsFolder: SystemEventsFolder { get } // The Shared Documents folder
    optional var speakableItemsFolder: SystemEventsFolder { get } // The Speakable Items folder
    optional var utilitiesFolder: SystemEventsFolder { get } // The Utilities folder
    optional var workflowsFolder: SystemEventsFolder { get } // The Automator Workflows folder
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsDomain {}

// MARK: SystemEventsClassicDomainObject
@objc public protocol SystemEventsClassicDomainObject: SystemEventsDomain {
    optional func folders() -> SBElementArray
    optional var appleMenuFolder: SystemEventsFolder { get } // The Apple Menu Items folder
    optional var controlPanelsFolder: SystemEventsFolder { get } // The Control Panels folder
    optional var controlStripModulesFolder: SystemEventsFolder { get } // The Control Strip Modules folder
    optional var desktopFolder: SystemEventsFolder { get } // The Classic Desktop folder
    optional var extensionsFolder: SystemEventsFolder { get } // The Extensions folder
    optional var fontsFolder: SystemEventsFolder { get } // The Fonts folder
    optional var launcherItemsFolder: SystemEventsFolder { get } // The Launcher Items folder
    optional var preferencesFolder: SystemEventsFolder { get } // The Classic Preferences folder
    optional var shutdownFolder: SystemEventsFolder { get } // The Shutdown Items folder
    optional var startupItemsFolder: SystemEventsFolder { get } // The StartupItems folder
    optional var systemFolder: SystemEventsFolder { get } // The System folder
}
extension SBObject: SystemEventsClassicDomainObject {}

// MARK: SystemEventsFile
@objc public protocol SystemEventsFile: SystemEventsDiskItem {
    optional var creatorType: AnyObject { get set } // the OSType identifying the application that created the file
    optional var defaultApplication: AnyObject { get set } // the application that will launch if the file is opened
    optional var fileType: AnyObject { get set } // the OSType identifying the type of data contained in the file
    optional var kind: String { get } // The kind of file, as shown in Finder
    optional var productVersion: String { get } // the version of the product (visible at the top of the "Get Info" window)
    optional var shortVersion: String { get } // the short version of the file
    optional var stationery: Bool { get set } // Is the file a stationery pad?
    optional var typeIdentifier: String { get } // The type identifier of the file
    optional var version: String { get } // the version of the file (visible at the bottom of the "Get Info" window)
    optional func open() -> AnyObject // Open a document.
}
extension SBObject: SystemEventsFile {}

// MARK: SystemEventsFilePackage
@objc public protocol SystemEventsFilePackage: SystemEventsFile {
    optional func aliases() -> SBElementArray
    optional func diskItems() -> SBElementArray
    optional func files() -> SBElementArray
    optional func filePackages() -> SBElementArray
    optional func folders() -> SBElementArray
}
extension SBObject: SystemEventsFilePackage {}

// MARK: SystemEventsFolder
@objc public protocol SystemEventsFolder: SystemEventsDiskItem {
    optional func aliases() -> SBElementArray
    optional func diskItems() -> SBElementArray
    optional func files() -> SBElementArray
    optional func filePackages() -> SBElementArray
    optional func folders() -> SBElementArray
}
extension SBObject: SystemEventsFolder {}

// MARK: SystemEventsLocalDomainObject
@objc public protocol SystemEventsLocalDomainObject: SystemEventsDomain {
    optional func folders() -> SBElementArray
}
extension SBObject: SystemEventsLocalDomainObject {}

// MARK: SystemEventsNetworkDomainObject
@objc public protocol SystemEventsNetworkDomainObject: SystemEventsDomain {
    optional func folders() -> SBElementArray
}
extension SBObject: SystemEventsNetworkDomainObject {}

// MARK: SystemEventsSystemDomainObject
@objc public protocol SystemEventsSystemDomainObject: SystemEventsDomain {
    optional func folders() -> SBElementArray
}
extension SBObject: SystemEventsSystemDomainObject {}

// MARK: SystemEventsUserDomainObject
@objc public protocol SystemEventsUserDomainObject: SystemEventsDomain {
    optional func folders() -> SBElementArray
    optional var desktopFolder: SystemEventsFolder { get } // The user's Desktop folder
    optional var documentsFolder: SystemEventsFolder { get } // The user's Documents folder
    optional var downloadsFolder: SystemEventsFolder { get } // The user's Downloads folder
    optional var favoritesFolder: SystemEventsFolder { get } // The user's Favorites folder
    optional var homeFolder: SystemEventsFolder { get } // The user's Home folder
    optional var moviesFolder: SystemEventsFolder { get } // The user's Movies folder
    optional var musicFolder: SystemEventsFolder { get } // The user's Music folder
    optional var picturesFolder: SystemEventsFolder { get } // The user's Pictures folder
    optional var publicFolder: SystemEventsFolder { get } // The user's Public folder
    optional var sitesFolder: SystemEventsFolder { get } // The user's Sites folder
    optional var temporaryItemsFolder: SystemEventsFolder { get } // The Temporary Items folder
}
extension SBObject: SystemEventsUserDomainObject {}

// MARK: SystemEventsFolderAction
@objc public protocol SystemEventsFolderAction: SBObjectProtocol {
    optional func scripts() -> SBElementArray
    optional var enabled: Bool { get set } // Is the folder action enabled?
    optional var name: String { get set } // the name of the folder action, which is also the name of the folder
    optional var path: AnyObject { get set } // the path to the folder to which the folder action applies
    optional var volume: String { get } // the volume on which the folder to which the folder action applies resides
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
    optional func enableProcessNewChanges(processNewChanges: SystemEventsSaveOptions) // Enable a folder action.
}
extension SBObject: SystemEventsFolderAction {}

// MARK: SystemEventsScript
@objc public protocol SystemEventsScript: SBObjectProtocol {
    optional var enabled: Bool { get set } // Is the script enabled?
    optional var name: String { get } // the name of the script
    optional var path: String { get } // the file system path of the script
    optional var POSIXPath: String { get } // the POSIX file system path of the script
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScript {}

// MARK: SystemEventsAction
@objc public protocol SystemEventsAction: SBObjectProtocol {
    optional var objectDescription: String { get } // what the action does
    optional var name: String { get } // the name of the action
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
    optional func perform() -> SystemEventsAction // cause the target process to behave as if the action were applied to its UI element
}
extension SBObject: SystemEventsAction {}

// MARK: SystemEventsAttribute
@objc public protocol SystemEventsAttribute: SBObjectProtocol {
    optional var name: String { get } // the name of the attribute
    optional var settable: Bool { get } // Can the attribute be set?
    optional var value: AnyObject { get set } // the current value of the attribute
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsAttribute {}

// MARK: SystemEventsUIElement
@objc public protocol SystemEventsUIElement: SBObjectProtocol {
    optional func actions() -> SBElementArray
    optional func attributes() -> SBElementArray
    optional func browsers() -> SBElementArray
    optional func busyIndicators() -> SBElementArray
    optional func buttons() -> SBElementArray
    optional func checkboxes() -> SBElementArray
    optional func colorWells() -> SBElementArray
    optional func columns() -> SBElementArray
    optional func comboBoxes() -> SBElementArray
    optional func drawers() -> SBElementArray
    optional func groups() -> SBElementArray
    optional func growAreas() -> SBElementArray
    optional func images() -> SBElementArray
    optional func incrementors() -> SBElementArray
    optional func lists() -> SBElementArray
    optional func menus() -> SBElementArray
    optional func menuBars() -> SBElementArray
    optional func menuBarItems() -> SBElementArray
    optional func menuButtons() -> SBElementArray
    optional func menuItems() -> SBElementArray
    optional func outlines() -> SBElementArray
    optional func popOvers() -> SBElementArray
    optional func popUpButtons() -> SBElementArray
    optional func progressIndicators() -> SBElementArray
    optional func radioButtons() -> SBElementArray
    optional func radioGroups() -> SBElementArray
    optional func relevanceIndicators() -> SBElementArray
    optional func rows() -> SBElementArray
    optional func scrollAreas() -> SBElementArray
    optional func scrollBars() -> SBElementArray
    optional func sheets() -> SBElementArray
    optional func sliders() -> SBElementArray
    optional func splitters() -> SBElementArray
    optional func splitterGroups() -> SBElementArray
    optional func staticTexts() -> SBElementArray
    optional func tabGroups() -> SBElementArray
    optional func tables() -> SBElementArray
    optional func textAreas() -> SBElementArray
    optional func textFields() -> SBElementArray
    optional func toolbars() -> SBElementArray
    optional func UIElements() -> SBElementArray
    optional func valueIndicators() -> SBElementArray
    optional func windows() -> SBElementArray
    optional var accessibilityDescription: AnyObject { get } // a more complete description of the UI element and its capabilities
    optional var objectDescription: AnyObject { get } // the accessibility description, if available; otherwise, the role description
    optional var enabled: AnyObject { get } // Is the UI element enabled? ( Does it accept clicks? )
    optional var entireContents: [AnyObject] { get } // a list of every UI element contained in this UI element and its child UI elements, to the limits of the tree
    optional var focused: AnyObject { get set } // Is the focus on this UI element?
    optional var help: AnyObject { get } // an elaborate description of the UI element and its capabilities
    optional var maximumValue: AnyObject { get } // the maximum value that the UI element can take on
    optional var minimumValue: AnyObject { get } // the minimum value that the UI element can take on
    optional var name: String { get } // the name of the UI Element, which identifies it within its container
    optional var orientation: AnyObject { get } // the orientation of the UI element
    optional var position: AnyObject { get set } // the position of the UI element
    optional var role: String { get } // an encoded description of the UI element and its capabilities
    optional var roleDescription: String { get } // a more complete description of the UI element's role
    optional var selected: AnyObject { get set } // Is the UI element selected?
    optional var size: AnyObject { get set } // the size of the UI element
    optional var subrole: AnyObject { get } // an encoded description of the UI element and its capabilities
    optional var title: String { get } // the title of the UI element as it appears on the screen
    optional var value: AnyObject { get set } // the current value of the UI element
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
    optional func clickAt(at: [AnyObject]!) -> AnyObject // cause the target process to behave as if the UI element were clicked
    optional func select() -> SystemEventsUIElement // set the selected property of the UI element
}
extension SBObject: SystemEventsUIElement {}

// MARK: SystemEventsBrowser
@objc public protocol SystemEventsBrowser: SystemEventsUIElement {
}
extension SBObject: SystemEventsBrowser {}

// MARK: SystemEventsBusyIndicator
@objc public protocol SystemEventsBusyIndicator: SystemEventsUIElement {
}
extension SBObject: SystemEventsBusyIndicator {}

// MARK: SystemEventsButton
@objc public protocol SystemEventsButton: SystemEventsUIElement {
}
extension SBObject: SystemEventsButton {}

// MARK: SystemEventsCheckbox
@objc public protocol SystemEventsCheckbox: SystemEventsUIElement {
}
extension SBObject: SystemEventsCheckbox {}

// MARK: SystemEventsColorWell
@objc public protocol SystemEventsColorWell: SystemEventsUIElement {
}
extension SBObject: SystemEventsColorWell {}

// MARK: SystemEventsColumn
@objc public protocol SystemEventsColumn: SystemEventsUIElement {
}
extension SBObject: SystemEventsColumn {}

// MARK: SystemEventsComboBox
@objc public protocol SystemEventsComboBox: SystemEventsUIElement {
}
extension SBObject: SystemEventsComboBox {}

// MARK: SystemEventsDrawer
@objc public protocol SystemEventsDrawer: SystemEventsUIElement {
}
extension SBObject: SystemEventsDrawer {}

// MARK: SystemEventsGroup
@objc public protocol SystemEventsGroup: SystemEventsUIElement {
    optional func checkboxes() -> SBElementArray
    optional func staticTexts() -> SBElementArray
}
extension SBObject: SystemEventsGroup {}

// MARK: SystemEventsGrowArea
@objc public protocol SystemEventsGrowArea: SystemEventsUIElement {
}
extension SBObject: SystemEventsGrowArea {}

// MARK: SystemEventsImage
@objc public protocol SystemEventsImage: SystemEventsUIElement {
}
extension SBObject: SystemEventsImage {}

// MARK: SystemEventsIncrementor
@objc public protocol SystemEventsIncrementor: SystemEventsUIElement {
}
extension SBObject: SystemEventsIncrementor {}

// MARK: SystemEventsList
@objc public protocol SystemEventsList: SystemEventsUIElement {
}
extension SBObject: SystemEventsList {}

// MARK: SystemEventsMenu
@objc public protocol SystemEventsMenu: SystemEventsUIElement {
    optional func menuItems() -> SBElementArray
}
extension SBObject: SystemEventsMenu {}

// MARK: SystemEventsMenuBar
@objc public protocol SystemEventsMenuBar: SystemEventsUIElement {
    optional func menus() -> SBElementArray
    optional func menuBarItems() -> SBElementArray
}
extension SBObject: SystemEventsMenuBar {}

// MARK: SystemEventsMenuBarItem
@objc public protocol SystemEventsMenuBarItem: SystemEventsUIElement {
    optional func menus() -> SBElementArray
}
extension SBObject: SystemEventsMenuBarItem {}

// MARK: SystemEventsMenuButton
@objc public protocol SystemEventsMenuButton: SystemEventsUIElement {
}
extension SBObject: SystemEventsMenuButton {}

// MARK: SystemEventsMenuItem
@objc public protocol SystemEventsMenuItem: SystemEventsUIElement {
    optional func menus() -> SBElementArray
}
extension SBObject: SystemEventsMenuItem {}

// MARK: SystemEventsOutline
@objc public protocol SystemEventsOutline: SystemEventsUIElement {
}
extension SBObject: SystemEventsOutline {}

// MARK: SystemEventsPopOver
@objc public protocol SystemEventsPopOver: SystemEventsUIElement {
}
extension SBObject: SystemEventsPopOver {}

// MARK: SystemEventsPopUpButton
@objc public protocol SystemEventsPopUpButton: SystemEventsUIElement {
}
extension SBObject: SystemEventsPopUpButton {}

// MARK: SystemEventsProcess
@objc public protocol SystemEventsProcess: SystemEventsUIElement {
    optional func menuBars() -> SBElementArray
    optional func windows() -> SBElementArray
    optional var acceptsHighLevelEvents: Bool { get } // Is the process high-level event aware (accepts open application, open document, print document, and quit)?
    optional var acceptsRemoteEvents: Bool { get } // Does the process accept remote events?
    optional var architecture: String { get } // the architecture in which the process is running
    optional var backgroundOnly: Bool { get } // Does the process run exclusively in the background?
    optional var bundleIdentifier: String { get } // the bundle identifier of the process' application file
    optional var Classic: Bool { get } // Is the process running in the Classic environment?
    optional var creatorType: String { get } // the OSType of the creator of the process (the signature)
    optional var displayedName: String { get } // the name of the file from which the process was launched, as displayed in the User Interface
    optional var file: AnyObject { get } // the file from which the process was launched
    optional var fileType: String { get } // the OSType of the file type of the process
    optional var frontmost: Bool { get set } // Is the process the frontmost process
    optional var hasScriptingTerminology: Bool { get } // Does the process have a scripting terminology, i.e., can it be scripted?
    optional func id() -> Int // The unique identifier of the process
    optional var name: String { get } // the name of the process
    optional var partitionSpaceUsed: Int { get } // the number of bytes currently used in the process' partition
    optional var shortName: AnyObject { get } // the short name of the file from which the process was launched
    optional var totalPartitionSize: Int { get } // the size of the partition with which the process was launched
    optional var unixId: Int { get } // The Unix process identifier of a process running in the native environment, or -1 for a process running in the Classic environment
    optional var visible: Bool { get set } // Is the process' layer visible?
}
extension SBObject: SystemEventsProcess {}

// MARK: SystemEventsApplicationProcess
@objc public protocol SystemEventsApplicationProcess: SystemEventsProcess {
    optional var applicationFile: AnyObject { get } // a reference to the application file from which this process was launched
}
extension SBObject: SystemEventsApplicationProcess {}

// MARK: SystemEventsDeskAccessoryProcess
@objc public protocol SystemEventsDeskAccessoryProcess: SystemEventsProcess {
    optional var deskAccessoryFile: SystemEventsAlias { get } // a reference to the desk accessory file from which this process was launched
}
extension SBObject: SystemEventsDeskAccessoryProcess {}

// MARK: SystemEventsProgressIndicator
@objc public protocol SystemEventsProgressIndicator: SystemEventsUIElement {
}
extension SBObject: SystemEventsProgressIndicator {}

// MARK: SystemEventsRadioButton
@objc public protocol SystemEventsRadioButton: SystemEventsUIElement {
}
extension SBObject: SystemEventsRadioButton {}

// MARK: SystemEventsRadioGroup
@objc public protocol SystemEventsRadioGroup: SystemEventsUIElement {
    optional func radioButtons() -> SBElementArray
}
extension SBObject: SystemEventsRadioGroup {}

// MARK: SystemEventsRelevanceIndicator
@objc public protocol SystemEventsRelevanceIndicator: SystemEventsUIElement {
}
extension SBObject: SystemEventsRelevanceIndicator {}

// MARK: SystemEventsRow
@objc public protocol SystemEventsRow: SystemEventsUIElement {
}
extension SBObject: SystemEventsRow {}

// MARK: SystemEventsScrollArea
@objc public protocol SystemEventsScrollArea: SystemEventsUIElement {
}
extension SBObject: SystemEventsScrollArea {}

// MARK: SystemEventsScrollBar
@objc public protocol SystemEventsScrollBar: SystemEventsUIElement {
    optional func buttons() -> SBElementArray
    optional func valueIndicators() -> SBElementArray
}
extension SBObject: SystemEventsScrollBar {}

// MARK: SystemEventsSheet
@objc public protocol SystemEventsSheet: SystemEventsUIElement {
}
extension SBObject: SystemEventsSheet {}

// MARK: SystemEventsSlider
@objc public protocol SystemEventsSlider: SystemEventsUIElement {
}
extension SBObject: SystemEventsSlider {}

// MARK: SystemEventsSplitter
@objc public protocol SystemEventsSplitter: SystemEventsUIElement {
}
extension SBObject: SystemEventsSplitter {}

// MARK: SystemEventsSplitterGroup
@objc public protocol SystemEventsSplitterGroup: SystemEventsUIElement {
}
extension SBObject: SystemEventsSplitterGroup {}

// MARK: SystemEventsStaticText
@objc public protocol SystemEventsStaticText: SystemEventsUIElement {
    optional func images() -> SBElementArray
}
extension SBObject: SystemEventsStaticText {}

// MARK: SystemEventsTabGroup
@objc public protocol SystemEventsTabGroup: SystemEventsUIElement {
}
extension SBObject: SystemEventsTabGroup {}

// MARK: SystemEventsTable
@objc public protocol SystemEventsTable: SystemEventsUIElement {
}
extension SBObject: SystemEventsTable {}

// MARK: SystemEventsTextArea
@objc public protocol SystemEventsTextArea: SystemEventsUIElement {
}
extension SBObject: SystemEventsTextArea {}

// MARK: SystemEventsTextField
@objc public protocol SystemEventsTextField: SystemEventsUIElement {
}
extension SBObject: SystemEventsTextField {}

// MARK: SystemEventsToolbar
@objc public protocol SystemEventsToolbar: SystemEventsUIElement {
}
extension SBObject: SystemEventsToolbar {}

// MARK: SystemEventsValueIndicator
@objc public protocol SystemEventsValueIndicator: SystemEventsUIElement {
}
extension SBObject: SystemEventsValueIndicator {}

// MARK: SystemEventsPropertyListFile
@objc public protocol SystemEventsPropertyListFile: SystemEventsFile {
    optional var contents: SystemEventsPropertyListItem { get set } // the contents of the property list file; elements and properties of the property list item may be accessed as if they were elements and properties of the property list file
}
extension SBObject: SystemEventsPropertyListFile {}

// MARK: SystemEventsPropertyListItem
@objc public protocol SystemEventsPropertyListItem: SBObjectProtocol {
    optional func propertyListItems() -> SBElementArray
    optional var kind: NSNumber { get } // the kind of data stored in the property list item: boolean/data/date/list/number/record/string
    optional var name: String { get } // the name of the property list item ( if any )
    optional var text: String { get set } // the text representation of the property list data
    optional var value: AnyObject { get set } // the value of the property list item
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsPropertyListItem {}

// MARK: SystemEventsAnnotation
@objc public protocol SystemEventsAnnotation: SBObjectProtocol {
    optional var fullText: String { get } // the full text of the annotation
    optional func id() -> String // the unique identifier of the annotation
    optional var name: String { get } // the name of the annotation
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsAnnotation {}

// MARK: SystemEventsQuickTimeData
@objc public protocol SystemEventsQuickTimeData: SBObjectProtocol {
    optional func annotations() -> SBElementArray
    optional func tracks() -> SBElementArray
    optional var autoPlay: Bool { get } // will the movie automatically start playing? (saved with QuickTime file)
    optional var autoPresent: Bool { get } // will the movie automatically start presenting? (saved with QuickTime file)
    optional var autoQuitWhenDone: Bool { get } // will the player automatically quit when done playing? (saved with QuickTime file)
    optional var creationTime: NSDate { get } // the creation time of the QuickTime file
    optional var dataSize: Int { get } // the size of the QuickTime file data
    optional var duration: Int { get } // the duration of the QuickTime file, in terms of the time scale
    optional var href: String { get } // the internet location to open when clicking on the movie (overrides track hrefs)
    optional var looping: Bool { get } // keep playing the movie in a loop?
    optional var modificationTime: NSDate { get } // the modification time of the QuickTime file
    optional var preferredRate: Int { get } // the preferred rate of the QuickTime file
    optional var preferredVolume: Int { get } // the preferred volume of the QuickTime file
    optional var presentationMode: SystemEventsPrmd { get } // mode in which the movie will be presented
    optional var presentationSize: SystemEventsMvsz { get } // size at which the movie will be presented
    optional var storedStream: Bool { get } // is this a stored streaming movie?
    optional var timeScale: Int { get } // the time scale of the QuickTime file
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsQuickTimeData {}

// MARK: SystemEventsAudioData
@objc public protocol SystemEventsAudioData: SystemEventsQuickTimeData {
}
extension SBObject: SystemEventsAudioData {}

// MARK: SystemEventsMovieData
@objc public protocol SystemEventsMovieData: SystemEventsQuickTimeData {
    optional var bounds: [AnyObject] { get } // the bounding rectangle of the movie file
    optional var naturalDimensions: [AnyObject] { get } // the dimensions the movie has when it is not scaled
    optional var previewDuration: Int { get } // the preview duration of the movie file
    optional var previewTime: Int { get } // the preview time of the movie file
}
extension SBObject: SystemEventsMovieData {}

// MARK: SystemEventsQuickTimeFile
@objc public protocol SystemEventsQuickTimeFile: SystemEventsFile {
    optional var contents: SystemEventsQuickTimeData { get } // the contents of the QuickTime file; elements and properties of the QuickTime data may be accessed as if they were elements and properties of the QuickTime file
}
extension SBObject: SystemEventsQuickTimeFile {}

// MARK: SystemEventsAudioFile
@objc public protocol SystemEventsAudioFile: SystemEventsQuickTimeFile {
    optional var contents: SystemEventsAudioData { get } // the contents of the audio file; elements and properties of the audio data may be accessed as if they were elements and properties of the audio file
}
extension SBObject: SystemEventsAudioFile {}

// MARK: SystemEventsMovieFile
@objc public protocol SystemEventsMovieFile: SystemEventsQuickTimeFile {
    optional var contents: SystemEventsMovieData { get } // the contents of the movie file; elements and properties of the movie data may be accessed as if they were elements and properties of the movie file
}
extension SBObject: SystemEventsMovieFile {}

// MARK: SystemEventsTrack
@objc public protocol SystemEventsTrack: SBObjectProtocol {
    optional func annotations() -> SBElementArray
    optional var audioChannelCount: Int { get } // the number of channels in the audio
    optional var audioCharacteristic: Bool { get } // can the track be heard?
    optional var audioSampleRate: Double { get } // the sample rate of the audio in kHz
    optional var audioSampleSize: Int { get } // the size of uncompressed audio samples in bits
    optional var creationTime: NSDate { get } // the creation time of the track
    optional var dataFormat: String { get } // the data format
    optional var dataRate: Int { get } // the data rate (bytes/sec) of the track
    optional var dataSize: Int { get } // the size of the track data
    optional var dimensions: [AnyObject] { get } // the current dimensions of the track
    optional var duration: Int { get } // the duration of the track, in terms of the time scale
    optional var enabled: Bool { get set } // should this track be used when the movie is playing?
    optional var highQuality: Bool { get set } // is the track high quality?
    optional var href: String { get } // the internet location to open when clicking on the track
    optional var kind: String { get } // the name of the media in the track, in the current language (e.g., 'Sound', 'Video', 'Text', ...)
    optional var modificationTime: NSDate { get } // the modification time of the track
    optional var name: String { get } // the name of the track
    optional var startTime: Int { get set } // the time delay before this track starts playing
    optional var type: String { get } // the type of media in the track (e.g., 'soun', 'vide', 'text', ...)
    optional var typeClass: String { get } // deprecated: use "type" instead ( included only to resolve a terminology conflict, script text will be updated upon compilation )
    optional var videoDepth: Int { get } // the color depth of the video
    optional var visualCharacteristic: Bool { get } // can the track be seen?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsTrack {}

// MARK: SystemEventsXMLAttribute
@objc public protocol SystemEventsXMLAttribute: SBObjectProtocol {
    optional var name: String { get } // the name of the XML attribute
    optional var value: AnyObject { get set } // the value of the XML attribute
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsXMLAttribute {}

// MARK: SystemEventsXMLData
@objc public protocol SystemEventsXMLData: SBObjectProtocol {
    optional func XMLElements() -> SBElementArray
    optional func id() -> String // the unique identifier of the XML data
    optional var name: String { get set } // the name of the XML data
    optional var text: String { get set } // the text representation of the XML data
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsXMLData {}

// MARK: SystemEventsXMLElement
@objc public protocol SystemEventsXMLElement: SBObjectProtocol {
    optional func XMLAttributes() -> SBElementArray
    optional func XMLElements() -> SBElementArray
    optional func id() -> String // the unique identifier of the XML element
    optional var name: String { get } // the name of the XML element
    optional var value: AnyObject { get set } // the value of the XML element
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsXMLElement {}

// MARK: SystemEventsXMLFile
@objc public protocol SystemEventsXMLFile: SystemEventsFile {
    optional var contents: SystemEventsXMLData { get set } // the contents of the XML file; elements and properties of the XML data may be accessed as if they were elements and properties of the XML file
}
extension SBObject: SystemEventsXMLFile {}

// MARK: SystemEventsPrintSettings
@objc public protocol SystemEventsPrintSettings: SBObjectProtocol {
    optional var copies: Int { get set } // the number of copies of a document to be printed
    optional var collating: Bool { get set } // Should printed copies be collated?
    optional var startingPage: Int { get set } // the first page of the document to be printed
    optional var endingPage: Int { get set } // the last page of the document to be printed
    optional var pagesAcross: Int { get set } // number of logical pages laid across a physical page
    optional var pagesDown: Int { get set } // number of logical pages laid out down a physical page
    optional var requestedPrintTime: NSDate { get set } // the time at which the desktop printer should print the document
    optional var errorHandling: SystemEventsEnum { get set } // how errors are handled
    optional var faxNumber: String { get set } // for fax number
    optional var targetPrinter: String { get set } // for target printer
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsPrintSettings {}

// MARK: SystemEventsScriptingClass
@objc public protocol SystemEventsScriptingClass: SBObjectProtocol {
    optional func scriptingElements() -> SBElementArray
    optional func scriptingProperties() -> SBElementArray
    optional var name: String { get } // The name of the class
    optional func id() -> String // The unique identifier of the class
    optional var objectDescription: String { get } // The description of the class
    optional var hidden: Bool { get } // Is the class hidden?
    optional var pluralName: String { get } // The plural name of the class
    optional var suiteName: String { get } // The name of the suite to which this class belongs
    optional var superclass: SystemEventsScriptingClass { get } // The class from which this class inherits
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingClass {}

// MARK: SystemEventsScriptingCommand
@objc public protocol SystemEventsScriptingCommand: SBObjectProtocol {
    optional func scriptingParameters() -> SBElementArray
    optional var name: String { get } // The name of the command
    optional func id() -> String // The unique identifier of the command
    optional var objectDescription: String { get } // The description of the command
    optional var directParameter: SystemEventsScriptingParameter { get } // The direct parameter of the command
    optional var hidden: Bool { get } // Is the command hidden?
    optional var scriptingResult: SystemEventsScriptingResultObject { get } // The object or data returned by this command
    optional var suiteName: String { get } // The name of the suite to which this command belongs
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingCommand {}

// MARK: SystemEventsScriptingDefinitionObject
@objc public protocol SystemEventsScriptingDefinitionObject: SBObjectProtocol {
    optional func scriptingSuites() -> SBElementArray
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingDefinitionObject {}

// MARK: SystemEventsScriptingElement
@objc public protocol SystemEventsScriptingElement: SystemEventsScriptingClass {
}
extension SBObject: SystemEventsScriptingElement {}

// MARK: SystemEventsScriptingEnumeration
@objc public protocol SystemEventsScriptingEnumeration: SBObjectProtocol {
    optional func scriptingEnumerators() -> SBElementArray
    optional var name: String { get } // The name of the enumeration
    optional func id() -> String // The unique identifier of the enumeration
    optional var hidden: Bool { get } // Is the enumeration hidden?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingEnumeration {}

// MARK: SystemEventsScriptingEnumerator
@objc public protocol SystemEventsScriptingEnumerator: SBObjectProtocol {
    optional var name: String { get } // The name of the enumerator
    optional func id() -> String // The unique identifier of the enumerator
    optional var objectDescription: String { get } // The description of the enumerator
    optional var hidden: Bool { get } // Is the enumerator hidden?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingEnumerator {}

// MARK: SystemEventsScriptingParameter
@objc public protocol SystemEventsScriptingParameter: SBObjectProtocol {
    optional var name: String { get } // The name of the parameter
    optional func id() -> String // The unique identifier of the parameter
    optional var objectDescription: String { get } // The description of the parameter
    optional var hidden: Bool { get } // Is the parameter hidden?
    optional var kind: String { get } // The kind of object or data specified by this parameter
    optional var optional: Bool { get } // Is the parameter optional?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingParameter {}

// MARK: SystemEventsScriptingProperty
@objc public protocol SystemEventsScriptingProperty: SBObjectProtocol {
    optional var name: String { get } // The name of the property
    optional func id() -> String // The unique identifier of the property
    optional var access: SystemEventsAccs { get } // The type of access to this property
    optional var objectDescription: String { get } // The description of the property
    optional var enumerated: Bool { get } // Is the property's value an enumerator?
    optional var hidden: Bool { get } // Is the property hidden?
    optional var kind: String { get } // The kind of object or data returned by this property
    optional var listed: Bool { get } // Is the property's value a list?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingProperty {}

// MARK: SystemEventsScriptingResultObject
@objc public protocol SystemEventsScriptingResultObject: SBObjectProtocol {
    optional var objectDescription: String { get } // The description of the property
    optional var enumerated: Bool { get } // Is the scripting result's value an enumerator?
    optional var kind: String { get } // The kind of object or data returned by this property
    optional var listed: Bool { get } // Is the scripting result's value a list?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingResultObject {}

// MARK: SystemEventsScriptingSuite
@objc public protocol SystemEventsScriptingSuite: SBObjectProtocol {
    optional func scriptingCommands() -> SBElementArray
    optional func scriptingClasses() -> SBElementArray
    optional func scriptingEnumerations() -> SBElementArray
    optional var name: String { get } // The name of the suite
    optional func id() -> String // The unique identifier of the suite
    optional var objectDescription: String { get } // The description of the suite
    optional var hidden: Bool { get } // Is the suite hidden?
    optional func closeSaving(saving: SystemEventsSaveOptions, savingIn: SystemEventsFile!) // Close a document.
    optional func saveIn(`in`: SystemEventsFile!, `as`: SystemEventsSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: SystemEventsPrintSettings!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}
extension SBObject: SystemEventsScriptingSuite {}
