
#import "LuvColorController.h"
#import "ColorMachineApplication.h"


@implementation LuvColorController

- (void)awakeFromNib{
  [self color] = new LuvColor;
  [sliderL initWithController:self
                    colorType:CML_COLOR_Luv
         normedinputconverter:cmlGetNormedInputConverter(CML_COLOR_Luv)
        normedoutputconverter:cmlGetNormedOutputConverter(CML_COLOR_Luv)
                     channelx:0
                     channely:(size_t)-1
                 drawspectrum:NO];
  [slideru initWithController:self
                    colorType:CML_COLOR_Luv
         normedinputconverter:cmlGetNormedInputConverter(CML_COLOR_Luv)
        normedoutputconverter:cmlGetNormedOutputConverter(CML_COLOR_Luv)
                     channelx:1
                     channely:(size_t)-1
                 drawspectrum:NO];
  [sliderv initWithController:self
                    colorType:CML_COLOR_Luv
         normedinputconverter:cmlGetNormedInputConverter(CML_COLOR_Luv)
        normedoutputconverter:cmlGetNormedOutputConverter(CML_COLOR_Luv)
                     channelx:2
                     channely:(size_t)-1
                 drawspectrum:NO];
  [(ColorWell*)colordisplay initWithController:self
                    colorType:CML_COLOR_Luv
         normedinputconverter:cmlGetNormedCartesianInputConverter(CML_COLOR_Luv)
        normedoutputconverter:cmlGetNormedCartesianOutputConverter(CML_COLOR_Luv)
                     channelx:1
                     channely:2
                 drawspectrum:NO];
}

- (IBAction)valueChangeLuv:(NSControl*)sender {
  LuvColor& luv = *(LuvColor*)[self color];
  float value = [sender floatValue];
  if      (sender == textFieldL){luv[0] = value;
  }else if(sender == textFieldu){luv[1] = value;
  }else if(sender == textFieldv){luv[2] = value;}
  [(ColorMachineApplication*)NSApp colorHasChanged];
}

- (void) update{
  LuvColor& luv = *(LuvColor*)[self color];
  luv = [(ColorMachineApplication*)NSApp getCurrentColor]->toLuv();
  [textFieldL setStringValue:[NSString stringWithFormat:@"%3.02f", luv[0]]];
  [textFieldu setStringValue:[NSString stringWithFormat:@"%3.02f", luv[1]]];
  [textFieldv setStringValue:[NSString stringWithFormat:@"%3.02f", luv[2]]];
//  [self setNeedsDisplay:YES];
  [colordisplay setNeedsDisplay:YES];
  [sliderL setNeedsDisplay:YES];
  [slideru setNeedsDisplay:YES];
  [sliderv setNeedsDisplay:YES];
}

- (void)setActive:(BOOL)newactive{
  if(newactive){
    [labelL setTextColor:[NSColor whiteColor]];
    [labelu setTextColor:[NSColor whiteColor]];
    [labelv setTextColor:[NSColor whiteColor]];
  }else{
    [labelL setTextColor:[NSColor blackColor]];
    [labelu setTextColor:[NSColor blackColor]];
    [labelv setTextColor:[NSColor blackColor]];
  }
  [super setActive:newactive];
}

@end
