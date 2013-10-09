//
//  TiUIWindow.m
//  ProperBarColor
//
//  Created by Marcus Olovsson on 2013-10-07.
//
//

#import "TiUIWindow+WithColorLayer.h"
#import "ComMrcsProperbarcolorModule.m"

@implementation TiUIWindowProxy (WithColorLayer)

static CGFloat const kDefaultColorLayerOpacity = 0.75f;
static CGFloat const kSpaceToCoverStatusBars = 20.0f;

CALayer *colorLayer;

-(void)setBarColor:(id)colorString
{
    ENSURE_UI_THREAD(setBarColor,colorString);

    NSString *color = [TiUtils stringValue:colorString];
    [self replaceValue:color forKey:@"barColor" notification:NO];
    if (shouldUpdateNavBar && controller!=nil && [controller navigationController] != nil)
    {
        TiColor * newColor = [TiUtils colorValue:color];
        if (newColor == nil)
        {
            newColor =[TiUtils colorValue:[[self tabGroup] valueForKey:@"barColor"]];
        }
        UIColor * barColor = [TiUtils barColorForColor:newColor];
        UIBarStyle navBarStyle = [TiUtils barStyleForColor:newColor];
        
        UINavigationBar * navBar = [[controller navigationController] navigationBar];
        [navBar setBarStyle:barStyle];
        if([TiUtils isIOS7OrGreater]) {
            [navBar performSelector:@selector(setBarTintColor:) withObject:barColor];
            if (!colorLayer) {
                //[[controller navigationController] setDelegate:self];
                colorLayer = [CALayer layer];
                colorLayer.opacity = [ComMrcsProperbarcolorModule staticLayerOpacity];
                [navBar.layer addSublayer:colorLayer];
                //[self.layer addSublayer:self.colorLayer];
                colorLayer.frame = CGRectMake(0, 0 - kSpaceToCoverStatusBars, CGRectGetWidth(navBar.bounds), CGRectGetHeight(navBar.bounds) + kSpaceToCoverStatusBars);
            }
            colorLayer.backgroundColor = barColor.CGColor;
        } else {
            [navBar setTintColor:barColor];
        }
        [self performSelector:@selector(refreshBackButton) withObject:nil afterDelay:0.0];

    }
    
}

-(void)willChangeSize
{
    if (colorLayer != nil) {
        UINavigationBar * navBar = [[controller navigationController] navigationBar];
        colorLayer.frame = CGRectMake(0, 0 - kSpaceToCoverStatusBars, CGRectGetWidth(navBar.bounds), CGRectGetHeight(navBar.bounds) + kSpaceToCoverStatusBars);
        
        [navBar.layer insertSublayer:colorLayer atIndex:1];
    }
}


@end