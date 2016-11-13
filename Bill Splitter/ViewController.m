//
//  ViewController.m
//  Bill Splitter
//
//  Created by carmen cheng on 2016-11-11.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *totalAmount;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *splitAmount;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeople;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)slider:(id)sender {
    int rounded = roundf(self.slider.value);
    self.numberOfPeople.text = [NSString stringWithFormat:@"Between %d people",rounded];
}

- (IBAction)calculateSplitAmount:(id)sender {
    
    if (self.totalAmount.text && self.totalAmount.text.length > 0) {
        int rounded = roundf(self.slider.value);
        NSDecimalNumber *numberOfPeople =[[NSDecimalNumber alloc] initWithInt:rounded];
        NSDecimalNumber *totalAmount = [[NSDecimalNumber alloc]initWithString:self.totalAmount.text];
        NSDecimalNumber *split = [totalAmount decimalNumberByDividingBy:numberOfPeople];
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setMaximumFractionDigits:2];
        
        self.splitAmount.text = [NSString stringWithFormat:@"$ %@", [numberFormatter stringFromNumber:split]];

    }else {
        self.splitAmount.text = [NSString stringWithFormat:@"no bill was entered"];
    }
}



@end
