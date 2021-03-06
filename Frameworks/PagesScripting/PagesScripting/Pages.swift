import AppKit
import ScriptingBridge

@objc public protocol SBObjectProtocol: NSObjectProtocol {
    func get() -> AnyObject!
}

@objc public protocol SBApplicationProtocol: SBObjectProtocol {
    func activate()
    var delegate: SBApplicationDelegate! { get set }
}

// MARK: PagesSaveOptions
@objc public enum PagesSaveOptions : AEKeyword {
    case Yes = 0x79657320 /* 'yes ' */
    case No = 0x6e6f2020 /* 'no  ' */
    case Ask = 0x61736b20 /* 'ask ' */
}

// MARK: PagesPrintingErrorHandling
@objc public enum PagesPrintingErrorHandling : AEKeyword {
    case Standard = 0x6c777374 /* 'lwst' */
    case Detailed = 0x6c776474 /* 'lwdt' */
}

// MARK: PagesSaveableFileFormat
@objc public enum PagesSaveableFileFormat : AEKeyword {
    case PagesFormat = 0x50676666 /* 'Pgff' */
}

// MARK: PagesExportFormat
@objc public enum PagesExportFormat : AEKeyword {
    case Epub = 0x50657075 /* 'Pepu' */
    case UnformattedText = 0x50747866 /* 'Ptxf' */
    case PDF = 0x50706466 /* 'Ppdf' */
    case MicrosoftWord = 0x50777264 /* 'Pwrd' */
    case Pages09 = 0x50506167 /* 'PPag' */
}

// MARK: PagesTAVT
@objc public enum PagesTAVT : AEKeyword {
    case Bottom = 0x61766274 /* 'avbt' */
    case Center = 0x61637472 /* 'actr' */
    case Top = 0x61767470 /* 'avtp' */
}

// MARK: PagesTAHT
@objc public enum PagesTAHT : AEKeyword {
    case AutoAlign = 0x61617574 /* 'aaut' */
    case Center = 0x61637472 /* 'actr' */
    case Justify = 0x616a7374 /* 'ajst' */
    case Left = 0x616c6674 /* 'alft' */
    case Right = 0x61726974 /* 'arit' */
}

// MARK: PagesNMSD
@objc public enum PagesNMSD : AEKeyword {
    case Ascending = 0x6173636e /* 'ascn' */
    case Descending = 0x6473636e /* 'dscn' */
}

// MARK: PagesNMCT
@objc public enum PagesNMCT : AEKeyword {
    case Automatic = 0x66617574 /* 'faut' */
    case Checkbox = 0x66636368 /* 'fcch' */
    case Currency = 0x66637572 /* 'fcur' */
    case DateAndTime = 0x6664746d /* 'fdtm' */
    case Fraction = 0x66667261 /* 'ffra' */
    case Number = 0x6e6d6272 /* 'nmbr' */
    case Percent = 0x66706572 /* 'fper' */
    case PopUpMenu = 0x66637070 /* 'fcpp' */
    case Scientific = 0x66736369 /* 'fsci' */
    case Slider = 0x6663736c /* 'fcsl' */
    case Stepper = 0x66637374 /* 'fcst' */
    case Text = 0x63747874 /* 'ctxt' */
    case Duration = 0x66647572 /* 'fdur' */
    case Rating = 0x66726174 /* 'frat' */
    case NumeralSystem = 0x66636e73 /* 'fcns' */
}

// MARK: PagesItemFillOptions
@objc public enum PagesItemFillOptions : AEKeyword {
    case NoFill = 0x66696e6f /* 'fino' */
    case ColorFill = 0x6669636f /* 'fico' */
    case GradientFill = 0x66696772 /* 'figr' */
    case AdvancedGradientFill = 0x66696167 /* 'fiag' */
    case ImageFill = 0x6669696d /* 'fiim' */
    case AdvancedImageFill = 0x66696169 /* 'fiai' */
}

// MARK: PagesPlaybackRepetitionMethod
@objc public enum PagesPlaybackRepetitionMethod : AEKeyword {
    case None = 0x6d76726e /* 'mvrn' */
    case Loop = 0x6d766c70 /* 'mvlp' */
    case LoopBackAndForth = 0x6d766266 /* 'mvbf' */
}

// MARK: PagesGenericMethods
@objc public protocol PagesGenericMethods {
    optional func closeSaving(saving: PagesSaveOptions, savingIn: NSURL!) // Close a document.
    optional func saveIn(in_: NSURL!, `as`: PagesSaveableFileFormat) // Save a document.
    optional func printWithProperties(withProperties: [NSObject : AnyObject]!, printDialog: Bool) // Print a document.
    optional func delete() // Delete an object.
    optional func duplicateTo(to: SBObject!, withProperties: [NSObject : AnyObject]!) // Copy an object.
    optional func moveTo(to: SBObject!) // Move an object to a new location.
}

// MARK: PagesApplication
@objc public protocol PagesApplication: SBApplicationProtocol {
    optional func documents() -> SBElementArray
    optional func windows() -> SBElementArray
    optional var name: String { get } // The name of the application.
    optional var frontmost: Bool { get } // Is this the active application?
    optional var version: String { get } // The version number of the application.
    optional func open(x: AnyObject!) -> AnyObject // Open a document.
    optional func print(x: AnyObject!, withProperties: [NSObject : AnyObject]!, printDialog: Bool) // Print a document.
    optional func quitSaving(saving: PagesSaveOptions) // Quit the application.
    optional func exists(x: AnyObject!) -> Bool // Verify that an object exists.
    optional func templates() -> SBElementArray
}
extension SBApplication: PagesApplication {}

// MARK: PagesDocument
@objc public protocol PagesDocument: SBObjectProtocol, PagesGenericMethods {
    optional var name: String { get } // Its name.
    optional var modified: Bool { get } // Has it been modified since the last save?
    optional var file: NSURL { get } // Its location on disk, if it has one.
    optional func exportTo(to: NSURL!, `as`: PagesExportFormat, withProperties: [NSObject : AnyObject]!) // Export a document to another file
    optional func audioClips() -> SBElementArray
    optional func charts() -> SBElementArray
    optional func groups() -> SBElementArray
    optional func images() -> SBElementArray
    optional func iWorkItems() -> SBElementArray
    optional func lines() -> SBElementArray
    optional func movies() -> SBElementArray
    optional func pages() -> SBElementArray
    optional func sections() -> SBElementArray
    optional func shapes() -> SBElementArray
    optional func tables() -> SBElementArray
    optional func textItems() -> SBElementArray
    optional func placeholderTexts() -> SBElementArray
    optional func id() -> String // Document ID.
    optional var documentTemplate: PagesTemplate { get } // The template assigned to the document.
    optional var bodyText: PagesRichText { get } // The document body text.
    optional var documentBody: Bool { get } // Whether the document has body text.
    optional var currentPage: PagesPage { get } // Current page of the document.
    optional func setBodyText(bodyText: PagesRichText!) // The document body text.
}
extension SBObject: PagesDocument {}

// MARK: PagesWindow
@objc public protocol PagesWindow: SBObjectProtocol, PagesGenericMethods {
    optional var name: String { get } // The title of the window.
    optional func id() -> Int // The unique identifier of the window.
    optional var index: Int { get } // The index of the window, ordered front to back.
    optional var bounds: NSRect { get } // The bounding rectangle of the window.
    optional var closeable: Bool { get } // Does the window have a close button?
    optional var miniaturizable: Bool { get } // Does the window have a minimize button?
    optional var miniaturized: Bool { get } // Is the window minimized right now?
    optional var resizable: Bool { get } // Can the window be resized?
    optional var visible: Bool { get } // Is the window visible right now?
    optional var zoomable: Bool { get } // Does the window have a zoom button?
    optional var zoomed: Bool { get } // Is the window zoomed right now?
    optional var document: PagesDocument { get } // The document whose contents are displayed in the window.
    optional func setIndex(index: Int) // The index of the window, ordered front to back.
    optional func setBounds(bounds: NSRect) // The bounding rectangle of the window.
    optional func setMiniaturized(miniaturized: Bool) // Is the window minimized right now?
    optional func setVisible(visible: Bool) // Is the window visible right now?
    optional func setZoomed(zoomed: Bool) // Is the window zoomed right now?
}
extension SBObject: PagesWindow {}

// MARK: PagesTemplate
@objc public protocol PagesTemplate: SBObjectProtocol, PagesGenericMethods {
    optional func id() -> String // The identifier used by the application.
    optional var name: String { get } // The localized name displayed to the user.
}
extension SBObject: PagesTemplate {}

// MARK: PagesSection
@objc public protocol PagesSection: SBObjectProtocol, PagesGenericMethods {
    optional func audioClips() -> SBElementArray
    optional func charts() -> SBElementArray
    optional func groups() -> SBElementArray
    optional func images() -> SBElementArray
    optional func iWorkItems() -> SBElementArray
    optional func lines() -> SBElementArray
    optional func movies() -> SBElementArray
    optional func pages() -> SBElementArray
    optional func shapes() -> SBElementArray
    optional func tables() -> SBElementArray
    optional func textItems() -> SBElementArray
    optional var bodyText: PagesRichText { get } // The section body text.
    optional func setBodyText(bodyText: PagesRichText!) // The section body text.
}
extension SBObject: PagesSection {}

// MARK: PagesRichText
@objc public protocol PagesRichText: SBObjectProtocol, PagesGenericMethods {
    optional func characters() -> SBElementArray
    optional func paragraphs() -> SBElementArray
    optional func words() -> SBElementArray
    optional func placeholderTexts() -> SBElementArray
    optional var color: NSColor { get } // The color of the font. Expressed as an RGB value consisting of a list of three color values from 0 to 65535. ex: Blue = {0, 0, 65535}.
    optional var font: String { get } // The name of the font.  Can be the PostScript name, such as: “TimesNewRomanPS-ItalicMT”, or display name: “Times New Roman Italic”. TIP: Use the Font Book application get the information about a typeface.
    optional var size: Int { get } // The size of the font.
    optional func setColor(color: NSColor!) // The color of the font. Expressed as an RGB value consisting of a list of three color values from 0 to 65535. ex: Blue = {0, 0, 65535}.
    optional func setFont(font: String!) // The name of the font.  Can be the PostScript name, such as: “TimesNewRomanPS-ItalicMT”, or display name: “Times New Roman Italic”. TIP: Use the Font Book application get the information about a typeface.
    optional func setSize(size: Int) // The size of the font.
}
extension SBObject: PagesRichText {}

// MARK: PagesCharacter
@objc public protocol PagesCharacter: PagesRichText {
}
extension SBObject: PagesCharacter {}

// MARK: PagesParagraph
@objc public protocol PagesParagraph: PagesRichText {
    optional func characters() -> SBElementArray
    optional func words() -> SBElementArray
    optional func placeholderTexts() -> SBElementArray
}
extension SBObject: PagesParagraph {}

// MARK: PagesWord
@objc public protocol PagesWord: PagesRichText {
    optional func characters() -> SBElementArray
}
extension SBObject: PagesWord {}

// MARK: PagesPlaceholderText
@objc public protocol PagesPlaceholderText: PagesRichText {
    optional var tag: String { get } // Its script tag.
    optional func setTag(tag: String!) // Its script tag.
}
extension SBObject: PagesPlaceholderText {}

// MARK: PagesIWorkContainer
@objc public protocol PagesIWorkContainer: SBObjectProtocol, PagesGenericMethods {
    optional func audioClips() -> SBElementArray
    optional func charts() -> SBElementArray
    optional func images() -> SBElementArray
    optional func iWorkItems() -> SBElementArray
    optional func groups() -> SBElementArray
    optional func lines() -> SBElementArray
    optional func movies() -> SBElementArray
    optional func shapes() -> SBElementArray
    optional func tables() -> SBElementArray
    optional func textItems() -> SBElementArray
}
extension SBObject: PagesIWorkContainer {}

// MARK: PagesPage
@objc public protocol PagesPage: PagesIWorkContainer {
    optional var bodyText: PagesRichText { get } // The page body text.
    optional func setBodyText(bodyText: PagesRichText!) // The page body text.
}
extension SBObject: PagesPage {}

// MARK: PagesIWorkItem
@objc public protocol PagesIWorkItem: SBObjectProtocol, PagesGenericMethods {
    optional var height: Int { get } // The height of the iWork item.
    optional var locked: Bool { get } // Whether the object is locked.
    optional var parent: PagesIWorkContainer { get } // The iWork container containing this iWork item.
    optional var position: NSPoint { get } // The horizontal and vertical coordinates of the top left point of the iWork item.
    optional var width: Int { get } // The width of the iWork item.
    optional func setHeight(height: Int) // The height of the iWork item.
    optional func setLocked(locked: Bool) // Whether the object is locked.
    optional func setPosition(position: NSPoint) // The horizontal and vertical coordinates of the top left point of the iWork item.
    optional func setWidth(width: Int) // The width of the iWork item.
}
extension SBObject: PagesIWorkItem {}

// MARK: PagesAudioClip
@objc public protocol PagesAudioClip: PagesIWorkItem {
    optional var fileName: AnyObject { get } // The name of the audio file.
    optional var clipVolume: Int { get } // The volume setting for the audio clip, from 0 (none) to 100 (full volume).
    optional var repetitionMethod: PagesPlaybackRepetitionMethod { get } // If or how the audio clip repeats.
    optional func setFileName(fileName: AnyObject!) // The name of the audio file.
    optional func setClipVolume(clipVolume: Int) // The volume setting for the audio clip, from 0 (none) to 100 (full volume).
    optional func setRepetitionMethod(repetitionMethod: PagesPlaybackRepetitionMethod) // If or how the audio clip repeats.
}
extension SBObject: PagesAudioClip {}

// MARK: PagesShape
@objc public protocol PagesShape: PagesIWorkItem {
    optional var backgroundFillType: PagesItemFillOptions { get } // The background, if any, for the shape.
    optional var objectText: PagesRichText { get } // The text contained within the shape.
    optional var reflectionShowing: Bool { get } // Is the iWork item displaying a reflection?
    optional var reflectionValue: Int { get } // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional var rotation: Int { get } // The rotation of the iWork item, in degrees from 0 to 359.
    optional var opacity: Int { get } // The opacity of the object, in percent.
    optional func setObjectText(objectText: PagesRichText!) // The text contained within the shape.
    optional func setReflectionShowing(reflectionShowing: Bool) // Is the iWork item displaying a reflection?
    optional func setReflectionValue(reflectionValue: Int) // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional func setRotation(rotation: Int) // The rotation of the iWork item, in degrees from 0 to 359.
    optional func setOpacity(opacity: Int) // The opacity of the object, in percent.
}
extension SBObject: PagesShape {}

// MARK: PagesChart
@objc public protocol PagesChart: PagesIWorkItem {
}
extension SBObject: PagesChart {}

// MARK: PagesImage
@objc public protocol PagesImage: PagesIWorkItem {
    optional var objectDescription: String { get } // Text associated with the image, read aloud by VoiceOver.
    optional var file: NSURL { get } // The image file.
    optional var fileName: AnyObject { get } // The name of the image file.
    optional var opacity: Int { get } // The opacity of the object, in percent.
    optional var reflectionShowing: Bool { get } // Is the iWork item displaying a reflection?
    optional var reflectionValue: Int { get } // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional var rotation: Int { get } // The rotation of the iWork item, in degrees from 0 to 359.
    optional func setObjectDescription(objectDescription: String!) // Text associated with the image, read aloud by VoiceOver.
    optional func setFileName(fileName: AnyObject!) // The name of the image file.
    optional func setOpacity(opacity: Int) // The opacity of the object, in percent.
    optional func setReflectionShowing(reflectionShowing: Bool) // Is the iWork item displaying a reflection?
    optional func setReflectionValue(reflectionValue: Int) // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional func setRotation(rotation: Int) // The rotation of the iWork item, in degrees from 0 to 359.
}
extension SBObject: PagesImage {}

// MARK: PagesGroup
@objc public protocol PagesGroup: PagesIWorkContainer {
    optional var height: Int { get } // The height of the iWork item.
    optional var parent: PagesIWorkContainer { get } // The iWork container containing this iWork item.
    optional var position: NSPoint { get } // The horizontal and vertical coordinates of the top left point of the iWork item.
    optional var width: Int { get } // The width of the iWork item.
    optional var rotation: Int { get } // The rotation of the iWork item, in degrees from 0 to 359.
    optional func setHeight(height: Int) // The height of the iWork item.
    optional func setPosition(position: NSPoint) // The horizontal and vertical coordinates of the top left point of the iWork item.
    optional func setWidth(width: Int) // The width of the iWork item.
    optional func setRotation(rotation: Int) // The rotation of the iWork item, in degrees from 0 to 359.
}
extension SBObject: PagesGroup {}

// MARK: PagesLine
@objc public protocol PagesLine: PagesIWorkItem {
    optional var endPoint: NSPoint { get } // A list of two numbers indicating the horizontal and vertical position of the line ending point.
    optional var reflectionShowing: Bool { get } // Is the iWork item displaying a reflection?
    optional var reflectionValue: Int { get } // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional var rotation: Int { get } // The rotation of the iWork item, in degrees from 0 to 359.
    optional var startPoint: NSPoint { get } // A list of two numbers indicating the horizontal and vertical position of the line starting point.
    optional func setEndPoint(endPoint: NSPoint) // A list of two numbers indicating the horizontal and vertical position of the line ending point.
    optional func setReflectionShowing(reflectionShowing: Bool) // Is the iWork item displaying a reflection?
    optional func setReflectionValue(reflectionValue: Int) // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional func setRotation(rotation: Int) // The rotation of the iWork item, in degrees from 0 to 359.
    optional func setStartPoint(startPoint: NSPoint) // A list of two numbers indicating the horizontal and vertical position of the line starting point.
}
extension SBObject: PagesLine {}

// MARK: PagesMovie
@objc public protocol PagesMovie: PagesIWorkItem {
    optional var fileName: AnyObject { get } // The name of the movie file.
    optional var movieVolume: Int { get } // The volume setting for the movie, from 0 (none) to 100 (full volume).
    optional var opacity: Int { get } // The opacity of the object, in percent.
    optional var reflectionShowing: Bool { get } // Is the iWork item displaying a reflection?
    optional var reflectionValue: Int { get } // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional var repetitionMethod: PagesPlaybackRepetitionMethod { get } // If or how the movie repeats.
    optional var rotation: Int { get } // The rotation of the iWork item, in degrees from 0 to 359.
    optional func setFileName(fileName: AnyObject!) // The name of the movie file.
    optional func setMovieVolume(movieVolume: Int) // The volume setting for the movie, from 0 (none) to 100 (full volume).
    optional func setOpacity(opacity: Int) // The opacity of the object, in percent.
    optional func setReflectionShowing(reflectionShowing: Bool) // Is the iWork item displaying a reflection?
    optional func setReflectionValue(reflectionValue: Int) // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional func setRepetitionMethod(repetitionMethod: PagesPlaybackRepetitionMethod) // If or how the movie repeats.
    optional func setRotation(rotation: Int) // The rotation of the iWork item, in degrees from 0 to 359.
}
extension SBObject: PagesMovie {}

// MARK: PagesTable
@objc public protocol PagesTable: PagesIWorkItem {
    optional func cells() -> SBElementArray
    optional func rows() -> SBElementArray
    optional func columns() -> SBElementArray
    optional func ranges() -> SBElementArray
    optional var name: String { get } // The item's name.
    optional var cellRange: PagesRange { get } // The range describing every cell in the table.
    optional var selectionRange: PagesRange { get } // The cells currently selected in the table.
    optional var rowCount: Int { get } // The number of rows in the table.
    optional var columnCount: Int { get } // The number of columns in the table.
    optional var headerRowCount: Int { get } // The number of header rows in the table.
    optional var headerColumnCount: Int { get } // The number of header columns in the table.
    optional var footerRowCount: Int { get } // The number of footer rows in the table.
    optional func sortBy(by: PagesColumn!, direction: PagesNMSD, inRows: PagesRange!) // Sort the rows of the table.
    optional func setName(name: String!) // The item's name.
    optional func setSelectionRange(selectionRange: PagesRange!) // The cells currently selected in the table.
    optional func setRowCount(rowCount: Int) // The number of rows in the table.
    optional func setColumnCount(columnCount: Int) // The number of columns in the table.
    optional func setHeaderRowCount(headerRowCount: Int) // The number of header rows in the table.
    optional func setHeaderColumnCount(headerColumnCount: Int) // The number of header columns in the table.
    optional func setFooterRowCount(footerRowCount: Int) // The number of footer rows in the table.
}
extension SBObject: PagesTable {}

// MARK: PagesTextItem
@objc public protocol PagesTextItem: PagesIWorkItem {
    optional var backgroundFillType: PagesItemFillOptions { get } // The background, if any, for the text item.
    optional var objectText: PagesRichText { get } // The text contained within the text item.
    optional var opacity: Int { get } // The opacity of the object, in percent.
    optional var reflectionShowing: Bool { get } // Is the iWork item displaying a reflection?
    optional var reflectionValue: Int { get } // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional var rotation: Int { get } // The rotation of the iWork item, in degrees from 0 to 359.
    optional func setObjectText(objectText: PagesRichText!) // The text contained within the text item.
    optional func setOpacity(opacity: Int) // The opacity of the object, in percent.
    optional func setReflectionShowing(reflectionShowing: Bool) // Is the iWork item displaying a reflection?
    optional func setReflectionValue(reflectionValue: Int) // The percentage of reflection of the iWork item, from 0 (none) to 100 (full).
    optional func setRotation(rotation: Int) // The rotation of the iWork item, in degrees from 0 to 359.
}
extension SBObject: PagesTextItem {}

// MARK: PagesRange
@objc public protocol PagesRange: SBObjectProtocol, PagesGenericMethods {
    optional func cells() -> SBElementArray
    optional func columns() -> SBElementArray
    optional func rows() -> SBElementArray
    optional var fontName: String { get } // The font of the range's cells.
    optional var fontSize: Double { get } // The font size of the range's cells.
    optional var format: PagesNMCT { get } // The format of the range's cells.
    optional var alignment: PagesTAHT { get } // The horizontal alignment of content in the range's cells.
    optional var name: String { get } // The range's coordinates.
    optional var textColor: NSColor { get } // The text color of the range's cells.
    optional var textWrap: Bool { get } // Whether text should wrap in the range's cells.
    optional var backgroundColor: NSColor { get } // The background color of the range's cells.
    optional var verticalAlignment: PagesTAVT { get } // The vertical alignment of content in the range's cells.
    optional func clear() // Clear the contents of a specified range of cells. Only content is removed; formatting and style are preserved.
    optional func merge() // Merge a specified range of cells.
    optional func unmerge() // Unmerge all merged cells in a specified range.
    optional func setFontName(fontName: String!) // The font of the range's cells.
    optional func setFontSize(fontSize: Double) // The font size of the range's cells.
    optional func setFormat(format: PagesNMCT) // The format of the range's cells.
    optional func setAlignment(alignment: PagesTAHT) // The horizontal alignment of content in the range's cells.
    optional func setTextColor(textColor: NSColor!) // The text color of the range's cells.
    optional func setTextWrap(textWrap: Bool) // Whether text should wrap in the range's cells.
    optional func setBackgroundColor(backgroundColor: NSColor!) // The background color of the range's cells.
    optional func setVerticalAlignment(verticalAlignment: PagesTAVT) // The vertical alignment of content in the range's cells.
}
extension SBObject: PagesRange {}

// MARK: PagesCell
@objc public protocol PagesCell: PagesRange {
    optional var column: PagesColumn { get } // The cell's column.
    optional var row: PagesRow { get } // The cell's row.
    optional var value: AnyObject { get } // The actual value in the cell, or missing value if the cell is empty.
    optional var formattedValue: String { get } // The formatted value in the cell, or missing value if the cell is empty.
    optional var formula: String { get } // The formula in the cell, as text, e.g. =SUM(40+2). If the cell does not contain a formula, returns missing value. To set the value of a cell to a formula as text, use the value property.
    optional func setValue(value: AnyObject!) // The actual value in the cell, or missing value if the cell is empty.
}
extension SBObject: PagesCell {}

// MARK: PagesRow
@objc public protocol PagesRow: PagesRange {
    optional var address: Int { get } // The row's index in the table (e.g., the second row has address 2).
    optional var height: Double { get } // The height of the row.
    optional func setHeight(height: Double) // The height of the row.
}
extension SBObject: PagesRow {}

// MARK: PagesColumn
@objc public protocol PagesColumn: PagesRange {
    optional var address: Int { get } // The column's index in the table (e.g., the second column has address 2).
    optional var width: Double { get } // The width of the column.
    optional func setWidth(width: Double) // The width of the column.
}
extension SBObject: PagesColumn {}

