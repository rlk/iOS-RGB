#import "RGBViewController.h"

@interface RGBViewController ()

- (IBAction)updateColor:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (weak, nonatomic) IBOutlet UISlider *rSlider;
@property (weak, nonatomic) IBOutlet UISlider *gSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;

@property (weak, nonatomic) IBOutlet UITextField *rTextField;
@property (weak, nonatomic) IBOutlet UITextField *gTextField;
@property (weak, nonatomic) IBOutlet UITextField *bTextField;

@property CGFloat r;
@property CGFloat g;
@property CGFloat b;

@end

@implementation RGBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.r = 0.0;
    self.g = 0.0;
    self.b = 0.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)updateColor:(id)sender
{
    self.r = self.rSlider.value;
    self.g = self.gSlider.value;
    self.b = self.bSlider.value;
    
    self.rTextField.text = [NSString stringWithFormat:@"%.2f", self.r];
    self.gTextField.text = [NSString stringWithFormat:@"%.2f", self.g];
    self.bTextField.text = [NSString stringWithFormat:@"%.2f", self.b];
    
    self.colorView.backgroundColor = [UIColor colorWithRed:self.r
                                                     green:self.g
                                                      blue:self.b
                                                     alpha:1];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];

    self.r = [self.rTextField.text floatValue];
    self.g = [self.gTextField.text floatValue];
    self.b = [self.bTextField.text floatValue];
    
    self.rSlider.value = self.r;
    self.gSlider.value = self.g;
    self.bSlider.value = self.b;
    
    self.colorView.backgroundColor = [UIColor colorWithRed:self.r
                                                     green:self.g
                                                      blue:self.b
                                                     alpha:1];
    return YES;
}

@end
