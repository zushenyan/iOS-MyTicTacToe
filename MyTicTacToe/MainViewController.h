//
//  MainViewController.h
//  MyTicTacToe
//
//  Created by zushenyan on 8/14/13.
//  Copyright (c) 2013 andrewyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardViewController.h"

@interface MainViewController : UIViewController
{
    BoardViewController *_bvc;
}

- (IBAction)newGame:(id)sender;

@end
