//
//  ImageHelper.m
//  TestApp
//
//  Created by admin on 04.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//

#import "ImageHelper.h"

@implementation ImageHelper

@synthesize imageCache;

+(ImageHelper *)instance {
    static dispatch_once_t pred;
    static ImageHelper *instance = nil;
    dispatch_once(&pred, ^{
        instance = [[ImageHelper alloc] init];
        
        instance.imageCache = [[NSCache alloc] init];
        
            });
    return instance;
}


-(UIImage*)resizedImage:(UIImage*)inImage  inRect:(CGRect)thumbRect : (id) cachKey  {
	// Creates a bitmap-based graphics context and makes it the current context.
    if(![imageCache objectForKey:cachKey])
    {
//    [imageCache setObject:inImage forKey:cachKey];
	UIGraphicsBeginImageContext(thumbRect.size);
	[inImage drawInRect:thumbRect];
    	
	return UIGraphicsGetImageFromCurrentImageContext();
        
    }
    else
    {
        return [imageCache objectForKey:cachKey];
    }
}

@end
