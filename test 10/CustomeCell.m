//
//  CustomeCell.m
//  test
//
//  Created by admin on 03.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//

#import "CustomeCell.h"

@implementation CustomeCell

@synthesize label1 = _label1;
@synthesize thumbnailImageView = thumbnailImageView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
