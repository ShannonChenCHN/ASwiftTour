//
//  ContactsViewController.m
//  Contacts
//
//  Created by ShannonChen on 2017/1/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-swift.h"

@interface ContactsViewController ()

@property (strong, nonatomic, readonly) NSMutableArray <Contact *> *contacts;
    
@end

@implementation ContactsViewController
    
static NSString * const cellIdentifier = @"UITableViewCell";
    
- (instancetype)initWithCoder:(NSCoder *)coder
    {
        self = [super initWithCoder:coder];
        if (self) {
            Contact *Jhonny = [[Contact alloc] initWithFirstName:@"Jhonny" lastName:@"Wall"];
            Contact *Paul = [[Contact alloc] initWithFirstName:@"Paul" lastName:@"Gorge"];
            Contact *Jane = [[Contact alloc] initWithFirstName:@"Jane" lastName:@"Brown"];
            
            _contacts = [NSMutableArray arrayWithArray:@[Jhonny, Paul, Jane]];
        }
        return self;
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}


#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.fullName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - Navigation
- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue {
    
}

- (IBAction)createNewContact:(UIStoryboardSegue *)segue {
    ContactDetailViewController *newContactVC = segue.sourceViewController;
    NSString *firstName = newContactVC.firstNameTextField.text;
    NSString *lastName = newContactVC.lastNameTextField.text;
    
    if (firstName.length > 0 && lastName.length > 0) {
        
        Contact *aNewContact = [[Contact alloc] initWithFirstName:firstName lastName:lastName];
        [self.contacts addObject:aNewContact];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.contacts.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    }
}

@end
