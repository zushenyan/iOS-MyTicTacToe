//
//  BoardViewController.m
//  MyTicTacToe
//
//  Created by zushenyan on 8/14/13.
//  Copyright (c) 2013 andrewyan. All rights reserved.
//

#import "BoardViewController.h"

@interface BoardViewController ()

@end

@implementation BoardViewController

- (id)initWithController:(MainViewController *)controller{
    self = [super initWithNibName:nil bundle:nil];
    
    if(self){
        _gm = [[GameManager alloc] init];
        
        _cells = [[NSMutableArray alloc]init];
        
        for(int i = 1; i < 10; i++){
            UIButton *button = (UIButton *)[[self view] viewWithTag:i];
            [_cells addObject:button];
        }
        
        [self updateTurnState];
        
        _mvc = controller;
    }
    
    return self;
}

//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)madeAMove:(id)sender{
    int tag = ((UIButton *)sender).tag;
    
    BOOL result = [_gm makeAMove:(tag - 1)];
    
    if(result){
        UIButton *button = (UIButton *)[[self view] viewWithTag:tag];
        if([_gm previousTurn] == O_CELL){
            [button setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            
        }
        else{
            [button setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
        [self updateTurnState];
    }
    else{
        [currentPlayer setText:@"invalid movement!"];
    }
    
    int state = [_gm checkWinner];
    
    if(state != STATE_DUELING){
        NSString *title = nil;
        
        if(state == STATE_O_WIN){
            title = @"O player wins!";
        }
        else if(state == STATE_X_WIN){
            title = @"X player wins!";
        }
        else{
            title = @"draw!";
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:@"again?"
                                                       delegate:self
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"Yes", nil];
        
        [alert show];
    }
}

- (void)goBack:(id)sender{
    [UIApplication sharedApplication].delegate.window.rootViewController = (UIViewController *)_mvc;
}

- (void)updateTurnState{
    if([_gm currentTurn] == O_CELL){
        [currentPlayer setText:@"O\'s turn"];
    }
    else{
        [currentPlayer setText:@"X\'s turn"];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"No"]){
        [UIApplication sharedApplication].delegate.window.rootViewController = (UIViewController *)_mvc;
    }
    else{
        [self resetGame];
    }
}

- (void)resetGame{
    [_gm resetGame];
    
    for(UIButton *button in _cells){
        [button setImage:nil forState:UIControlStateNormal];
    }
    
    [self updateTurnState];
}

@end
