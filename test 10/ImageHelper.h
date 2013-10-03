//
//  ImageHelper.h
//  TestApp
//
//  Created by admin on 04.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageHelper : NSObject

@property (nonatomic, retain) NSCache *imageCache;

+(ImageHelper *)instance;

-(UIImage*)resizedImage:(UIImage*)inImage  inRect:(CGRect) thumbRect : (id) cachKey;


@end
