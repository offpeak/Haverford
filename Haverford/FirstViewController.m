//
//  FirstViewController.m
//  Haverford
//
//  Created by Fitz Tepper on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation FirstViewController
@synthesize webview;





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
        

    }
    return self;
    
    
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{

    
    // Round corners using CALayer property
    
    [[image layer] setCornerRadius:10];
    [image setClipsToBounds:YES];
    
    // Create colored border using CALayer property 
    [[image layer] setBorderColor:
     [[UIColor colorWithRed:0 green:0. blue:0 alpha:1] CGColor]];
    // [[UIColor colorWithWhite:1 alpha:1] CGColor]];
    [[image layer] setBorderWidth:2.75];
    
    [[self view] addSubview:image];

    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"cork.jpg"]];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

   }

- (void)viewDidUnload

{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    
    //get the date today
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"cccc, MMMM dd"];
    
    NSString *dateToday = [dateformatter stringFromDate:[NSDate date]];
    
    [currentdate setText:dateToday];
    
    
    //get the time today
    NSDateFormatter *timeformatter = [[NSDateFormatter alloc] init];
    [timeformatter setDateFormat:@"hh:mm a"];
    
    NSString *timeToday = [timeformatter stringFromDate:[NSDate date]];
    [currenttime setText:timeToday];

    [super viewDidAppear:animated];
    
    //get the day of week
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    NSInteger weekday   = [components weekday];
    NSString *urlString;
    switch(weekday){
        case 1: // sunday
            image.image = [UIImage imageNamed:@"Monday.jpg"];
            break;
        case 2:
            image.image = [UIImage imageNamed:@"Monday.jpg"];
            
            break;
        case 3:
            image.image = [UIImage imageNamed:@"Tuesday.jpg"];
            break;
        case 4:
            image.image = [UIImage imageNamed:@"Wednesday.jpg"];
            break;
        case 5:
            image.image = [UIImage imageNamed:@"Monday.jpg"];
            break;
        case 6:
            image.image = [UIImage imageNamed:@"Tuesday.jpg"];
            break;
        case 7: // saturday
            image.image = [UIImage imageNamed:@"Monday.jpg"];
            break;
            
            }
      
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webview loadRequest:requestObj];
    
    

}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{

	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
