//
//  DataSource.h
//  TestApp
//
//  Created by admin on 03.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

@property (nonatomic, retain) NSMutableArray *shotNames;
@property (nonatomic, retain) NSMutableArray *shotImages;
@property (nonatomic, retain) NSMutableArray *shotIsFavorite;


+(DataSource *)instance;

- (void) setIsFavoriteItem :(int)index  over: (id) value;

- (id) getIsFavoriteItem :(int)index;

- (NSMutableArray *) getAllShotNames;

- (NSMutableArray *) getAllShotImages;

- (int) countOfShots;

- (int) countOfFavoriteShots;


@end
