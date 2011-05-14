//
//  PageControlDemoTableViewCell.h
//  PageControlDemo
//
//  Created by honcheng on 5/14/11.
//  Copyright 2011 BuUuK Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyledPageControl.h"

@interface PageControlDemoTableViewCell : UITableViewCell {
    StyledPageControl *pageControl;
}

@property (nonatomic, retain) StyledPageControl *pageControl;

@end
