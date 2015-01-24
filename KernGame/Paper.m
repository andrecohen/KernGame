//
//  Paper.m
//  KernGame
//
//  Created by Andre Cohen on 12/27/14.
//  Copyright (c) 2014 White Shoe Media. All rights reserved.
//

#import "Paper.h"
#import "Letter.h"

static int PaperMargin = 100;
static int PaperPadding = 100;
static int PaperWidth = 1200;

@implementation Paper

- (id)initWithFont:(UIFont *)aFont text:(NSString *)text {
	self = [super init];
	[self loadColors];
	
	[self setBackgroundColor:[UIColor clearColor]];
	
	font = aFont;
	
	CGPoint origin = CGPointMake(PaperMargin+PaperPadding, PaperMargin+PaperPadding);
	
	self.userInteractionEnabled = YES;
	
	for(int i=0; i<[text length]; i++) {
		float kern = 0;
		if(i>0)
			kern = [self kernBetweenCharacter:[text substringWithRange:NSMakeRange(0, i)]
									  andChar:[text substringWithRange:NSMakeRange(i, 1)]];
		
		
		if(origin.x+kern > PaperWidth-PaperPadding-PaperMargin) {
			origin.y += aFont.lineHeight;
			origin.x = PaperPadding+PaperMargin;
		}else{
			origin.x += kern;
		}
		
		CGPoint correct = CGPointMake(origin.x, origin.y);
		CGPoint wrong = CGPointMake(origin.x, origin.y);
		
		if(rand()%100<30) {
			wrong.x += (rand()%10-5);
		}
		
		Letter *l = [[Letter alloc] initWithPosition:wrong
									 correctPosition:correct
											  letter:[text characterAtIndex:i]
												font:font
											   color:foreground];
		origin.x += l.width;
		
		[self addSubview:l];
	}
	
	for(Letter *view in [self subviews]) {
		if(view.wrong){
			[self bringSubviewToFront:view];
		}
	}
	
	self.frame = CGRectMake(0, 0, PaperWidth+PaperMargin, origin.y+PaperPadding+font.lineHeight+PaperMargin);
	
	paperRect = self.frame;
	paperRect.origin.x += PaperMargin;
	paperRect.origin.y += PaperMargin;
	paperRect.size.height -= (PaperMargin+PaperPadding);
	paperRect.size.width -= (PaperMargin+PaperPadding);
	
	return self;
}

- (float)kernBetweenCharacter:(NSString *)charA andChar:(NSString *)charB {
	UIFont *font = [UIFont fontWithName:@"Helvetica" size:32];
	int aWidth = [charA sizeWithFont:font].width;
	int bWidth = [charB sizeWithFont:font].width;
	
	int full = [[NSString stringWithFormat:@"%@%@", charA, charB] sizeWithFont:font].width;
	
	return full-aWidth-bWidth;
}

- (void)drawRect:(CGRect)rect {
	
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGPathRef path = CGPathCreateWithRoundedRect(paperRect, 32, 32, nil);
	
	CGContextAddPath(context, path);
	CGContextSetFillColorWithColor(context, [background CGColor]);
	CGContextFillPath(context);
	
	[super drawRect:rect];
}

- (void)loadColors {
	NSArray *list = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Colors" ofType:@"plist"]];
	
	int cid = rand()%(list.count+1);
	
	NSDictionary *colors = [list objectAtIndex:cid];
	{
		unsigned rgbValue = 0;
		NSScanner *scanner = [NSScanner scannerWithString:[colors objectForKey:@"background"]];
		[scanner scanHexInt:&rgbValue];
		background = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
	}
	{
		unsigned rgbValue = 0;
		NSScanner *scanner = [NSScanner scannerWithString:[colors objectForKey:@"foreground"]];
		[scanner scanHexInt:&rgbValue];
		foreground = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
	}
	
}




@end
