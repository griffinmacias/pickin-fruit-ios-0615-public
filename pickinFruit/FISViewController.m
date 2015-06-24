//
//  FISViewController.m
//  pickinFruit
//
//  Created by Joe Burgess on 7/3/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()<UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate>

- (IBAction)spin:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fruitPicker.delegate = self;
    self.fruitPicker.dataSource = self;
    
	// Do any additional setup after loading the view, typically from a nib.

    self.fruitsArray = @[@"Apple",@"Orange",@"Banana",@"Pear",@"Grape", @"Kiwi", @"Mango", @"Blueberry", @"Raspberry"];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)spinTheWheel
{
    
    NSInteger random = arc4random_uniform(self.fruitsArray.count);
    NSInteger random2 = arc4random_uniform(self.fruitsArray.count);
    NSInteger random3 = arc4random_uniform(self.fruitsArray.count);
    
    [self.fruitPicker selectRow:random inComponent:0 animated:YES];
    [self.fruitPicker selectRow:random2 inComponent:1 animated:YES];
    [self.fruitPicker selectRow:random3 inComponent:2 animated:YES];
    
    [self winnerMatch];

}


- (IBAction)spin:(id)sender {
   
    [self spinTheWheel];
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
            return self.fruitsArray.count;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
    return self.fruitsArray[row];
    
}

-(void)winnerMatch
{
    NSUInteger firstSelectedRow = [self.fruitPicker selectedRowInComponent:0];
    NSUInteger secondtSelectedRow = [self.fruitPicker selectedRowInComponent:1];
    NSUInteger thirdSelectedRow = [self.fruitPicker selectedRowInComponent:2];
    NSString *alertMessage;

    if (firstSelectedRow == secondtSelectedRow && secondtSelectedRow == thirdSelectedRow) {
        alertMessage.accessibilityLabel = @"You lost!";
        alertMessage = @"Jackpot!";

        
    } else
    {
        alertMessage.accessibilityLabel = @"You lose!";
        alertMessage = @"Nope!";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:alertMessage
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Re-spin", nil];

    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self spinTheWheel];
    }
}

@end
