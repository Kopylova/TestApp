//
//  DataSource.m
//  TestApp
//
//  Created by admin on 03.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//




#import "DataSource.h"

@implementation DataSource

@synthesize shotImages, shotIsFavorite, shotNames;



+(DataSource *)instance {
    static dispatch_once_t pred;
    static DataSource *instance = nil;
    dispatch_once(&pred, ^{
        instance = [[DataSource alloc] init];
      
        instance.shotImages =  [NSMutableArray arrayWithObjects:@"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", @"11.jpg", @"12.jpg", @"13.jpg", @"14.jpg", @"15.jpg", @"16.jpg",@"17.jpg", @"18.jpg", @"19.jpg", @"20.jpg", @"21.jpg", @"22.jpg", @"23.jpg", @"24.jpg", @"25.jpg", @"26.jpg", @"27.jpg", @"28.jpg", @"29.jpg", @"30.jpg", @"31.jpg", @"32.jpg",@"33.jpg", @"34.jpg", @"35.jpg",@"36.jpg", @"37.jpg", @"38.jpg",@"39.jpg", @"40.jpg", @"41.jpg", @"42.jpg", @"43.jpg", @"44.jpg", @"45.jpg", @"46.jpg", @"47.jpg",@"48.jpg", @"49.jpg", @"50.jpg", nil];
        
        instance.shotNames = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16",@"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32",@"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", nil];
        
        instance.shotIsFavorite = [NSMutableArray arrayWithObjects:@0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,  nil];
        
    });
    return instance;
}

- (void) setIsFavoriteItem :(int)index  over: (id) value
{
    
    [shotIsFavorite replaceObjectAtIndex:index withObject:value];

}

- (id) getIsFavoriteItem :(int)index
{
    return [shotIsFavorite objectAtIndex: index];
    
}

- (NSMutableArray *) getAllShotNames
{
    return shotNames;
}

- (NSMutableArray *) getAllShotImages
{
    return shotImages;
}

- (int) countOfShots
{
    int countOfShots = 0;
    for(int i=0; i<shotImages.count; i++)
    {
        countOfShots++;
    }
    
    return countOfShots;
}

- (int) countOfFavoriteShots
{
    int countOfFavoriteShots = 0;
    for(int i=0; i<shotIsFavorite.count; i++)
    {
        id val = [shotIsFavorite objectAtIndex: i];
        if([val isEqual:@1])
        {
        countOfFavoriteShots++;
        }
    }
    
    return countOfFavoriteShots;
}


- (void)dealloc {
    [shotImages release];
    [shotIsFavorite release];
    [shotNames release];
    [super dealloc];
}

@end
