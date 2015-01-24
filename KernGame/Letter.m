	//
//  Letter.m
//  KernGame
//
//  Created by Andre Cohen on 12/27/14.
//  Copyright (c) 2014 White Shoe Media. All rights reserved.
//

#import "Letter.h"

@implementation Letter

@synthesize wrong;

- (id)initWithPosition:(CGPoint)position correctPosition:(CGPoint)correct letter:(char)letter font:(UIFont *)font color:(UIColor *)color{
	self = [super init];
	
	// Correct letter
	answer = [[SingleLetter alloc] init];
	answer.letter.font = font;
	answer.letter.text = [NSString stringWithFormat:@"%c", letter];
	[answer.letter sizeToFit];
	CGRect answerRect = answer.letter.frame;
	answerRect.origin = correct;
	answer.letter.frame = answerRect;
	[self addSubview:answer];

	// Original letter
	original = [[SingleLetter alloc] init];
	original.letter.font = font;
	original.letter.text = [NSString stringWithFormat:@"%c", letter];
	[original.letter sizeToFit];
	CGRect originalRect = original.letter.frame;
	originalRect.origin = position;
	original.letter.frame = originalRect;
	[self addSubview:original];
	
	// Movable letter
	movable = [[SingleLetter alloc] init];
	movable.letter.font = font;
	movable.letter.text = [NSString stringWithFormat:@"%c", letter];
	[movable.letter sizeToFit];
	CGRect movableRect = movable.letter.frame;
	movableRect.origin = position;
	movable.letter.frame = movableRect;
	[movable enableTouch];
	[self addSubview:movable];
	
	movable.letter.textColor = color;
	
	
	if(CGPointEqualToPoint(movableRect.origin, answerRect.origin) == YES) {
		movable.alpha = .3;
		self.wrong = NO;
	}else{
		self.userInteractionEnabled = YES;
		self.wrong = YES;
	}
	
	
	return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
	
	for (UIView * view in [self subviews])
	{
		if (!view.hidden && [view pointInside:[self convertPoint:point
														  toView:view] withEvent:event])
		{
			return YES;
		}
	}
	return [super pointInside:point withEvent:event];
}

- (void)drawRect:(CGRect)rect {
	
	[super drawRect:rect];
	
	
}

- (float)width {
	return original.letter.frame.size.width;
}

@end