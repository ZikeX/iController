//
//  ICTableViewCell.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICTableViewCell.h"
#import "ICGroupTableViewTools.h"
#import "ICSwitch.h"

@interface ICTableViewCell ()
{
	BOOL _showArrow;
	ICGroupTableViewRowType _rowType;
}

@end

@implementation ICTableViewCell

+ (instancetype)cellForTableView:(UITableView *)tableView {
	return [[self alloc] initWithReuseIdentifier:@"TableViewCell"];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	if (self) {
		_showArrow = NO;
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.textLabel.toSuperViewLeft = 20;
	self.detailTextLabel.toSuperViewRight = 20;
	self.accessoryView.toSuperViewRight = 10;
	switch (_rowType) {
		case ICGroupTableViewRowTypeTop: {
			self.textLabel.midY += 2.5;
			self.detailTextLabel.midX += 2.5;
			break;
		}
		case ICGroupTableViewRowTypeButtom: {
			self.textLabel.midY -= 2.5;
			self.detailTextLabel.midX -= 2.5;
			break;
		}
		default: {
			
		}
	}
	if ([self.accessoryView isKindOfClass:[ICSwitch class]]) {
		self.accessoryView.toSuperViewRight = 20;
	}
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
	[super setHighlighted:highlighted animated:animated];
	if (self.selectionStyle == UITableViewCellSelectionStyleNone) {
		return ;
	}
	if (highlighted) {
			self.textLabel.textColor = [UIColor whiteColor];
			self.detailTextLabel.textColor = [UIColor whiteColor];
			if (_showArrow) {
				UIImageView *imageView = (UIImageView *)self.accessoryView;
				imageView.image = [UIImage imageNamed:@"arrow3_down"];
			}
		
	} else {
			self.textLabel.textColor = Const_Color_Title;
			self.detailTextLabel.textColor = Const_Color_Subtitle;
			if (_showArrow) {
				UIImageView *imageView = (UIImageView *)self.accessoryView;
				imageView.image = [UIImage imageNamed:@"arrow3"];
			}
	}
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType {
	switch (accessoryType) {
		case UITableViewCellAccessoryDisclosureIndicator: {
			UIImage *image = nil;
			_showArrow = YES;
			if (self.isSelected) {
				image = [UIImage imageNamed:@"arrow3_down"];
			} else {
				image = [UIImage imageNamed:@"arrow3"];
			}
			[self setAccessoryView:[[UIImageView alloc] initWithImage:image]];
			break;
		}
		case UITableViewCellAccessoryNone:
			if (self.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
				self.accessoryView = nil;
			}
		default: {
			_showArrow = NO;
			[super setAccessoryType:accessoryType];
		}
	}
}

#pragma mark - Public method

- (void)setIndexPath:(NSIndexPath *)indexPath withTableView:(UITableView *)tableView {
	SetCellBackgroundView(self, tableView, indexPath);
	[self setNeedsLayout];
}

#pragma mark - Property getter

- (NSString *)textLabelText {
	return self.textLabel.text;
}

- (void)setTextLabelText:(NSString *)textLabelText {
	self.textLabel.text = textLabelText;
}

@end
