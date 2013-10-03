//
//  Cell.h
//  test
//
//  Created by admin on 03.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
  int _doubleDigits[10];
}
//@property (strong, nonatomic) NSMutableArray *arr;
@property(readonly) int *doubleDigits;
- (int)numberAtIndex:(int)index;
- (void)setNumber:(int)number atIndex:(int)index;

//@property (strong, nonatomic) NSString *label;

@end
