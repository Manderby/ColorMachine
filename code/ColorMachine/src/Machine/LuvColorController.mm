
#import "LuvColorController.h"
#import "ColorMachineApplication.h"


@implementation LuvColorController

- (void)awakeFromNib{
  [self color] = new LuvColor;
  [sliderL initWithController:self
                    colortype:CML_COLOR_Luv
         normedinputconverter:CMLgetNormedInputConverter(CML_COLOR_Luv)
        normedoutputconverter:CMLgetNormedOutputConverter(CML_COLOR_Luv)
                     channelx:0
                     channely:(CMLuint32)-1
                 drawspectrum:NO];
  [slideru initWithController:self
                    colortype:CML_COLOR_Luv
         normedinputconverter:CMLgetNormedInputConverter(CML_COLOR_Luv)
        normedoutputconverter:CMLgetNormedOutputConverter(CML_COLOR_Luv)
                     channelx:1
                     channely:(CMLuint32)-1
                 drawspectrum:NO];
  [sliderv initWithController:self
                    colortype:CML_COLOR_Luv
         normedinputconverter:CMLgetNormedInputConverter(CML_COLOR_Luv)
        normedoutputconverter:CMLgetNormedOutputConverter(CML_COLOR_Luv)
                     channelx:2
                     channely:(CMLuint32)-1
                 drawspectrum:NO];
  [(ColorWell*)colordisplay initWithController:self
                    colortype:CML_COLOR_Luv
         normedinputconverter:CMLgetNormedCartesianInputConverter(CML_COLOR_Luv)
        normedoutputconverter:CMLgetNormedCartesianOutputConverter(CML_COLOR_Luv)
                     channelx:1
                     channely:2
                 drawspectrum:NO];
}

- (IBAction)valueChangeLuv:(NSControl*)sender {
  LuvColor& Luv = *(LuvColor*)[self color];
  float value = [sender floatValue];
  if      (sender == textfieldL){Luv[0] = value;
  }else if(sender == textfieldu){Luv[1] = value;
  }else if(sender == textfieldv){Luv[2] = value;}
  [(ColorMachineApplication*)NSApp colorHasChanged];
}

- (void) update{
  LuvColor& Luv = *(LuvColor*)[self color];
  Luv = [(ColorMachineApplication*)NSApp getCurrentColor]->toLuv();
  [textfieldL setStringValue:[NSString stringWithFormat:@"%3.02f", Luv[0]]];
  [textfieldu setStringValue:[NSString stringWithFormat:@"%3.02f", Luv[1]]];
  [textfieldv setStringValue:[NSString stringWithFormat:@"%3.02f", Luv[2]]];
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