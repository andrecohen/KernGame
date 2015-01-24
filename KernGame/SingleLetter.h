//
//  SingleLetter.h
//  KernGame
//
//  Created by Andre Cohen on 12/27/14.
//  Copyright (c) 2014 White Shoe Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleLetter : UIView {
	CGPoint lastPosition;
}

@property (retain) UILabel *letter;

- (void)enableTouch;

- (void)tap:(UIGestureRecognizer *)gesture;

@end
