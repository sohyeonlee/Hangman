//
//  HangmanViewController.h
//  Hangman
//
//  Created by sohyeon on 2015. 3. 30..
//  Copyright (c) 2015년 sohyeonlee. All rights reserved.
//

#import "ViewController.h"

@interface HangmanViewController : ViewController <UITextFieldDelegate>

@property(nonatomic, retain) IBOutlet UIImageView *hangmanImg;
@property(nonatomic, retain) IBOutlet UILabel *hangmanWord;
@property(nonatomic, retain) NSString *correctWord;
@property(nonatomic, retain) NSString *wrongGuesses;

-(void) checkHangmanLetter: (NSString *) letterToCheck;
-(void) setupHangmanWord: (NSString *) hangmanWord;

@end
