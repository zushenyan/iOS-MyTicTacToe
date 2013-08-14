//
//  GameManager.h
//  MyTicTacToe
//
//  Created by zushenyan on 8/14/13.
//  Copyright (c) 2013 andrewyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SINGLE_PLAYER 1
#define TWO_PLAYER 2

#define EMPTY_CELL 0
#define O_CELL 1
#define X_CELL 2

#define STATE_DUELING -1
#define STATE_DRAW 0
#define STATE_O_WIN 1
#define STATE_X_WIN 2

@interface GameManager : NSObject
{
    NSMutableArray *_board;
    int _turn;
}

- (BOOL)makeAMove:(int)index;
- (int)checkWinner;
- (int)currentTurn;
- (int)previousTurn;
- (void)resetGame;
- (void)nextTurn;

@end
