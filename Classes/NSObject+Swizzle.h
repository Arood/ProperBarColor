//
//  Swizzle.h
//  ProperBarColor
//
//  Created by Marcus Olovsson on 2013-10-09.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)originalSelector
                withNewSelector:(SEL)newSelector;

@end