//
//  SingleLetter.m
//  KernGame
//
//  Created by Andre Cohen on 12/27/14.
//  Copyright (c) 2014 White Shoe Media. All rights reserved.
//

#import "SingleLetter.h"

@implementation SingleLetter

@synthesize letter;

- (id)init {
	self = [super init];
	
	
	self.letter = [[UILabel alloc] init];
	[self addSubview:self.letter];
	
	return self;
}

- (void)enableTouch {
	[self.letter sizeToFit];
	
	self.frame = self.letter.frame;
	CGRect frame = self.frame;
	frame.origin = CGPointZero;
	self.letter.frame = frame;
	
	self.userInteractionEnabled = YES;

	UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
	tap.minimumPressDuration = .1;
	tap.allowableMovement = YES;
	
	[self addGestureRecognizer:tap];

}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {

	return CGRectContainsPoint(self.letter.frame, point);
	
	return [super pointInside:point withEvent:event];
}
- (void)tap:(UIGestureRecognizer *)gesture {
	NSLog(@"Moving: %@", self.letter.text);
	
	CGRect frame = self.letter.frame;
	
	if(gesture.state == UIGestureRecognizerStateBegan) {
		lastPosition = [gesture locationInView:self.superview];
		self.letter.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:.2];
		self.letter.shadowOffset = CGSizeMake(0,6);
	}else{
		CGPoint p = [gesture locationInView:self.superview];
		frame.origin.x += -(lastPosition.x-p.x);
		lastPosition = p;
	}
	
	if(gesture.state == UIGestureRecognizerStateEnded) {
		self.letter.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:.2];
		self.letter.shadowOffset = CGSizeMake(0,0);
	}
	
	
	self.letter.frame = frame;
	
}

@end
