//
//  ViewController.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/22/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.face_up_down = false;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)card_click:(id)sender {
    NSLog(@"The value of face_up_down is %d",self.face_up_down);
    if (self.face_up_down) //True is face up
        [sender setBackgroundImage:[UIImage imageNamed:@"pokedoge"] forState:UIControlStateNormal];
    else
        [sender setBackgroundImage:[UIImage imageNamed:@"white_image"] forState:UIControlStateNormal];
    self.face_up_down = !self.face_up_down;
}

@end
