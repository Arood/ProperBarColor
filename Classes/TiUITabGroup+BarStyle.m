//
//  TiUITabGroup+BarStyle.m
//  ProperBarColor
//
//  Created by Marcus Olovsson on 2013-10-09.
//
//

#import "TiUITabGroup+BarStyle.h"

@implementation TiUITabGroupProxy (BarStyle)

-(void)setBarStyle:(id)value
{
    self.tabbar.barStyle = [TiUtils intValue:value];
}

@end
