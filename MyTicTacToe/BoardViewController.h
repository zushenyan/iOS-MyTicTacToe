//
//  BoardViewController.h
//  MyTicTacToe
//
//  Created by zushenyan on 8/14/13.
//  Copyright (c) 2013 andrewyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"

@class MainViewController;

@interface BoardViewController : UIViewController <UIAlertViewDelegate>
{
    __weak IBOutlet UILabel *currentPlayer;
    
    GameManager *_gm;
    NSMutableArray *_cells;
    MainViewController *_mvc;
}

- (IBAction)madeAMove:(id)sender;
- (IBAction)goBack:(id)sender;

- (id)initWithController:(MainViewController *) controller;

- (void)updateTurnState;
- (void)resetGame;

@end
