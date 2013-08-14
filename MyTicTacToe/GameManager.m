//
//  GameManager.m
//  MyTicTacToe
//
//  Created by zushenyan on 8/14/13.
//  Copyright (c) 2013 andrewyan. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

- (id)init{
    self = [super init];
    
    if(self){
        [self resetGame];
    }
    
    return self;
}

/*
 Make a successful movement will return YES, else NO.
 */
- (BOOL)makeAMove:(int)index{
    if([[_board objectAtIndex:index] intValue] == EMPTY_CELL){
        [_board replaceObjectAtIndex:index withObject:[NSNumber numberWithInt:[self currentTurn]]];
        [self nextTurn];
        return YES;
    }
    return NO;
}

- (int)checkWinner{
    int winner = EMPTY_CELL;
    //horizontal
    if([[_board objectAtIndex:0] intValue] == [[_board objectAtIndex:1] intValue] &&
       [[_board objectAtIndex:0] intValue] == [[_board objectAtIndex:2] intValue]){
        winner = [(NSNumber *)[_board objectAtIndex:0] intValue];
    }
    else if([[_board objectAtIndex:3] intValue] == [[_board objectAtIndex:4] intValue] &&
            [[_board objectAtIndex:3] intValue] == [[_board objectAtIndex:5] intValue]){
        winner = [(NSNumber *)[_board objectAtIndex:3] intValue];
    }
    else if([[_board objectAtIndex:6] intValue] == [[_board objectAtIndex:7] intValue] &&
            [[_board objectAtIndex:6] intValue] == [[_board objectAtIndex:8] intValue]){
        winner = [(NSNumber *)[_board objectAtIndex:6] intValue];
    }
    //vertical
    else if([[_board objectAtIndex:0] intValue] == [[_board objectAtIndex:3] intValue] &&
            [[_board objectAtIndex:0] intValue] == [[_board objectAtIndex:6] intValue]){
        winner = [(NSNumber *)[_board objectAtIndex:0] intValue];
    }
    else if([[_board objectAtIndex:1] intValue] == [[_board objectAtIndex:4] intValue] &&
            [[_board objectAtIndex:1] intValue] == [[_board objectAtIndex:7] intValue]){
        winner = [(NSNumber *)[_board objectAtIndex:1] intValue];
    }
    else if([[_board objectAtIndex:2] intValue] == [[_board objectAtIndex:5] intValue] &&
            [[_board objectAtIndex:2] intValue] == [[_board objectAtIndex:8] intValue]){
        winner = [(NSNumber *)[_board objectAtIndex:2] intValue];
    }
    //diagonal
    else if([[_board objectAtIndex:0] intValue] == [[_board objectAtIndex:4] intValue] &&
            [[_board objectAtIndex:0] intValue] == [[_board objectAtIndex:8] intValue]){
        winner = [(NSNumber *)[_board objectAtIndex:0] intValue];
    }
    else if([[_board objectAtIndex:2] intValue] == [[_board objectAtIndex:4] intValue] &&
            [[_board objectAtIndex:2] intValue] == [[_board objectAtIndex:6] intValue]){
        winner = [(NSNumber *)[_board objectAtIndex:2] intValue];
    }
    
    int filledCellCount = 0;
    for(int i = 0; i < _board.count; i++){
        if([[_board objectAtIndex:i] intValue] != EMPTY_CELL){
            filledCellCount++;
        }
    }
    
    if(filledCellCount == 9 && winner == EMPTY_CELL){
        return STATE_DRAW;
    }
    
    if(winner == O_CELL){
        return STATE_O_WIN;
    }
    else if(winner == X_CELL){
        return STATE_X_WIN;
    }
    
    return STATE_DUELING;
}

- (void)nextTurn{
    _turn = (_turn + 1) % 3;
    _turn = _turn == 0 ? 1 : _turn;
}

- (int)currentTurn{
    return _turn;
}

- (int)previousTurn{
    if([self currentTurn] == O_CELL){
        return X_CELL;
    }
    return O_CELL;
}

- (void)resetGame{
    _board = [[NSMutableArray alloc]initWithObjects:
              [NSNumber numberWithInt:EMPTY_CELL],
              [NSNumber numberWithInt:EMPTY_CELL],
              [NSNumber numberWithInt:EMPTY_CELL],
              [NSNumber numberWithInt:EMPTY_CELL],
              [NSNumber numberWithInt:EMPTY_CELL],
              [NSNumber numberWithInt:EMPTY_CELL],
              [NSNumber numberWithInt:EMPTY_CELL],
              [NSNumber numberWithInt:EMPTY_CELL],
              [NSNumber numberWithInt:EMPTY_CELL], nil];
    
    _turn = O_CELL;
}

- (void)cpuMove{
    int index = rand() % 10 + 1;
    
    BOOL result = NO;
    while((result = [self makeAMove:index])){
    }
}

@end
