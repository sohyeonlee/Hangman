//
//  HangmanViewController.m
//  Hangman
//
//  Created by sohyeon on 2015. 3. 30..
//  Copyright (c) 2015년 sohyeonlee. All rights reserved.
//

#import "HangmanViewController.h"
#import "HangmanWords.h"

@implementation HangmanViewController
@synthesize hangmanImg;
@synthesize hangmanWord;
@synthesize correctWord;
@synthesize wrongGuesses;

-(void) checkHangmanLetter: (NSString *) inLetter
{
    bool match = NO;
   
    NSRange hangmanRange;
    char currchar = [[inLetter uppercaseString] characterAtIndex:0];
    for (int i = 0; i < self.correctWord.length; i++)
    {
        char temp = [self.correctWord characterAtIndex:i];
        if (currchar == temp)
        {
            match = YES;
            hangmanRange = NSMakeRange(i, 1);
            self.hangmanWord.text = [self.hangmanWord.text stringByReplacingCharactersInRange:hangmanRange withString:inLetter];
        }
    }
    if (match == NO)
    {
        self.wrongGuesses = [self.wrongGuesses stringByReplacingOccurrencesOfString:inLetter withString:@""];
        self.wrongGuesses = [self.wrongGuesses stringByAppendingString:inLetter];
        switch (self.wrongGuesses.length) {
            case 1:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman1.gif"];
                break;
            case 2:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman2.gif"];
                break;
            case 3:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman3.gif"];
                break;
            case 4:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman4.gif"];
                break;
            case 5:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman5.gif"];
                break;
            case 6:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman6.gif"];
                break;
            case 7:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman7.gif"];
                break;
            case 8:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman8.gif"];
                break;
            case 9:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman9.gif"];
                break;
            case 10:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman10.gif"];
                break;
            case 11:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman11.gif"];
                break;
            case 12:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman12.gif"];
                break;
            case 13:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman13.gif"];
                break;
            case 14:
                self.hangmanImg.image = [UIImage imageNamed:@"Hangman14.gif"];
                break;
            default:
                [self setupHangmanWord:self.correctWord];
                break;
        }
    }
}
-(void) setupHangmanWord: (NSString *) hangmanWord
{
    self.wrongGuesses = @"";
    self.hangmanWord.text = @"";
    self.hangmanImg.image = [UIImage imageNamed:@"Hangman0.gif"];
    for (int i = 0; i < self.correctWord.length; i++)
    {
        self.hangmanWord.text = [self.hangmanWord.text stringByAppendingString:@"-"];
    }
}

#pragma mark - text box

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self checkHangmanLetter:string];
    [textField resignFirstResponder];
    return NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
#pragma mark - View Cycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    HangmanWords *newWord = [[HangmanWords alloc] init];
    NSArray *array = [[newWord getWord] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    int index = rand() % [array count];

    self.correctWord = [array objectAtIndex:index];
    NSLog(self.correctWord);
    [self setupHangmanWord:self.correctWord];
}


@end
