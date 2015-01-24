//
//  Letter.h
//  KernGame
//
//  Created by Andre Cohen on 12/27/14.
//  Copyright (c) 2014 White Shoe Media. All rights reserved.
//

#ifndef KernGame_Letter_h
#define KernGame_Letter_h

#import <UIKit/UIKit.h>
#import "SingleLetter.h"

@interface Letter : UIView {
	SingleLetter *original;
	SingleLetter *movable;
	SingleLetter *answer;
	
	CGPoint lastPosition;
}

@property (assign) BOOL wrong;

- (id)initWithPosition:(CGPoint)position correctPosition:(CGPoint)correct letter:(char)letter font:(UIFont *)font color:(UIColor *)color;


- (void)drawRect:(CGRect)rect;

- (float)width;

@end

#endif
