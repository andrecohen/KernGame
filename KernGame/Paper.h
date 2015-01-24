//
//  Paper.h
//  KernGame
//
//  Created by Andre Cohen on 12/27/14.
//  Copyright (c) 2014 White Shoe Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Paper : UIView {
	UIFont *font;
	
	CGRect paperRect;
	
	UIColor *background;
	UIColor *foreground;

}


- (id)initWithFont:(UIFont *)aFont text:(NSString *)text;
- (float)kernBetweenCharacter:(NSString *)charA andChar:(NSString *)charB;

- (void)drawRect:(CGRect)rect;

- (void)loadColors;


@end
