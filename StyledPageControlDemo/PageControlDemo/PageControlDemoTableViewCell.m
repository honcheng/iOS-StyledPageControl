//
//  PageControlDemoTableViewCell.m
//  PageControlDemo
//
//  Created by honcheng on 5/14/11.
//  Copyright 2011 BuUuK Pte Ltd. All rights reserved.
//

#import "PageControlDemoTableViewCell.h"


@implementation PageControlDemoTableViewCell
@synthesize pageControl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.pageControl = [[StyledPageControl alloc] initWithFrame:CGRectZero];
        [self.pageControl setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self.contentView addSubview:self.pageControl];
        [self.pageControl release];
        
        [self setSelectionStyle:UITableViewCellEditingStyleNone];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.pageControl setFrame:CGRectMake(20,10,self.frame.size.width-40,20)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
