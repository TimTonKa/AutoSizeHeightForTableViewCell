//
//  TableViewCell.m
//  AutoSizeHeightForTableViewCell
//
//  Created by 1134 on 2017/5/11.
//  Copyright © 2017年 1134. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellDataWithDict:(NSDictionary*)dict
{
    if (!dict) {
        NSLog(@"Dictionary is empty");
        return;
    }
    
    if ([dict objectForKey:@"first"]) {
        NSString *str = [dict objectForKey:@"first"];
        self.firstLabel.text = str;
    } else {
        self.firstLabel.text = @"";
    }
    
    if ([dict objectForKey:@"second"]) {
        NSString *str = [dict objectForKey:@"second"];
        self.secondLabel.text = str;
    } else {
        self.secondLabel.text = @"";
    }
    
}

@end
