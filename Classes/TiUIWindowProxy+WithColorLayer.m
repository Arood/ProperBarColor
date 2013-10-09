//
//  TiUIWindow.m
//  ProperBarColor
//
//  Created by Marcus Olovsson on 2013-10-07.
//
//

#import "TiUIWindowProxy+WithColorLayer.h"
#import "ComMrcsProperbarcolorModule.m"
#import "NSObject+Swizzle.h"

@implementation TiUIWindowProxy (WithColorLayer)

static CGFloat const kDefaultColorLayerOpacity = 0.75f;
static CGFloat const kSpaceToCoverStatusBars = 20.0f;

CALayer *colorLayer;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceSelector:@selector(setBarColor:)
                      withNewSelector:@selector(setProperBarColor:)];
    });
}

-(void)setProperBarColor:(id)colorString
{
    [self setProperBarColor:colorString];
    
    if([TiUtils isIOS7OrGreater] && shouldUpdateNavBar && controller!=nil && [controller navigationController] != nil) {
        
        UINavigationBar * navBar = [[controller navigationController] navigationBar];
        NSString *color = [TiUtils stringValue:colorString];
        TiColor * newColor = [TiUtils colorValue:color];
        if (newColor == nil)
        {
            newColor =[TiUtils colorValue:[[self tabGroup] valueForKey:@"barColor"]];
        }
        UIColor * barColor = [TiUtils barColorForColor:newColor];
        
        if (!colorLayer) {
            colorLayer = [CALayer layer];
            colorLayer.opacity = [ComMrcsProperbarcolorModule staticLayerOpacity];
            [navBar.layer addSublayer:colorLayer];
            colorLayer.frame = CGRectMake(0, 0 - kSpaceToCoverStatusBars, CGRectGetWidth(navBar.bounds), CGRectGetHeight(navBar.bounds) + kSpaceToCoverStatusBars);
        }
        colorLayer.backgroundColor = barColor.CGColor;
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

- (void)viewDidAppear:(BOOL)animated;     // Called when the view has been fully transitioned onto the screen. Default does nothing
{
    [self willChangeSize];
	[self updateTitleView];
	[super viewDidAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated;  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
{
    [self willChangeSize];
	[super viewDidDisappear:animated];
}

@end