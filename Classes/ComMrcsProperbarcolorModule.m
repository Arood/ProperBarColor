/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComMrcsProperbarcolorModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComMrcsProperbarcolorModule

static CGFloat _layerOpacity = 0.7f;

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"8594bf18-7644-423c-aa34-bcda06ce58a9";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.mrcs.properbarcolor";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Static APIs or something

+(CGFloat)staticLayerOpacity
{
	return _layerOpacity;
}

#pragma Public APIs

-(NSNumber*)layerOpacity
{
	// example property getter
	return [NSNumber numberWithFloat:_layerOpacity];
}

-(void)setLayerOpacity:(id)value
{
	// example property setter
    _layerOpacity = [TiUtils floatValue:value];
}

@end
