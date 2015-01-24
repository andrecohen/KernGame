//
//  ViewController.h
//  KernGame
//
//  Created by Andre Cohen on 12/14/14.
//  Copyright (c) 2014 White Shoe Media. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Paper.h"

@interface ViewController : UIViewController <UIScrollViewDelegate> {
	
	UIScrollView *scroll;
	Paper *paper;
	
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;

@end

