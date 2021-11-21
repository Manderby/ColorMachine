
#import "main.h"


@class GammaDisplay;

@class ThreeDeeWindowController;

@interface MachineWindowController : NSWindowController <NSWindowDelegate> {

  IBOutlet NSButton *maskstate;
  IBOutlet NSButton *gridlinesstate;

  IBOutlet NSPopUpButton* observerselect;
  IBOutlet NSPopUpButton* illuminationselect;
  IBOutlet NSPopUpButton* chromaticadaptationselect;
  IBOutlet NSPopUpButton* graycomputationselect;
  IBOutlet NSPopUpButton* labspaceselect;
  IBOutlet NSPopUpButton* rgbcolorspaceselect;
  IBOutlet NSPopUpButton* responseRGBselect;
  IBOutlet NSPopUpButton* responseLselect;
//  IBOutlet NSPopUpButton* cmyktransformselect;
  IBOutlet NSPopUpButton* maskselect;

  IBOutlet NSSlider *sliderT;
  IBOutlet NSSlider *sliderK;
  IBOutlet NSSlider *sliderke;
  IBOutlet NSSlider *slidergammaRGB;
  IBOutlet NSSlider *slideroffsetRGB;
  IBOutlet NSSlider *sliderlinscaleRGB;
  IBOutlet NSSlider *slidersplitRGB;
  IBOutlet NSSlider *slidergammaL;
  IBOutlet GammaDisplay *gammadisplay;

  IBOutlet NSTextField *textfieldT;
  IBOutlet NSTextField *textL;
  IBOutlet NSTextField *texta;
  IBOutlet NSTextField *textb;
  IBOutlet NSTextField *whitepointY;
  IBOutlet NSTextField *whitepointx;
  IBOutlet NSTextField *whitepointy;
  IBOutlet NSTextField *textfieldK;
  IBOutlet NSTextField *textfieldke;
  IBOutlet NSTextField *redprimaryY;
  IBOutlet NSTextField *redprimaryx;
  IBOutlet NSTextField *redprimaryy;
  IBOutlet NSTextField *greenprimaryY;
  IBOutlet NSTextField *greenprimaryx;
  IBOutlet NSTextField *greenprimaryy;
  IBOutlet NSTextField *blueprimaryY;
  IBOutlet NSTextField *blueprimaryx;
  IBOutlet NSTextField *blueprimaryy;
  IBOutlet NSTextField *textfieldgammaRGB;
  IBOutlet NSTextField *textfieldoffsetRGB;
  IBOutlet NSTextField *textfieldlinscaleRGB;
  IBOutlet NSTextField *textfieldsplitRGB;
  IBOutlet NSTextField *textfieldgammaL;

  BOOL colorselectionisExpanded;
  IBOutlet NSButton *collapseexpandColorSelectionButton;

  
}
- (void)awakeFromNib;

- (IBAction)maskstateChange:(NSButton*)sender;
- (IBAction)maskChange:(NSPopUpButton*)sender;
- (IBAction)gridlinesChange:(NSButton*)sender;

- (IBAction)observerChange:(NSPopUpButton*)sender;
- (IBAction)illuminationChange:(NSPopUpButton*)sender;
//- (IBAction)chromaticadaptationChange:(NSPopUpButton*)sender;
- (IBAction)whitepointChange:(NSControl*)sender;
- (IBAction)rgbprimariesChange:(NSControl*)sender;
- (IBAction)rgbresponseChange:(NSPopUpButton*)sender;
- (IBAction)rgbgammaChange:(NSControl*)sender;
- (IBAction)rgboffsetChange:(NSControl*)sender;
- (IBAction)rgblinscaleChange:(NSControl*)sender;
- (IBAction)rgbsplitChange:(NSControl*)sender;
- (IBAction)graycomputationChange:(NSPopUpButton*)sender;
- (IBAction)labspaceChange:(NSPopUpButton*)sender;
- (IBAction)labresponseChange:(NSPopUpButton*)sender;
- (IBAction)labgammaChange:(NSControl*)sender;
- (IBAction)rgbspaceChange:(NSPopUpButton*)sender;

- (IBAction)valueChangeT:(NSControl*)sender;
- (IBAction)valueChangeK:(NSControl*)sender;
- (IBAction)valueChangeke:(NSControl*)sender;

- (IBAction)toggleColorSelection:(id)sender;
- (void)collapseColorSelection;
- (void)expandColorSelection;


- (void)windowDidChangeScreenProfile:(NSNotification *)notification;
//- (void)windowDidChangeBackingProperties:(NSNotification *)notification;

- (void)updateMachine;

@end


