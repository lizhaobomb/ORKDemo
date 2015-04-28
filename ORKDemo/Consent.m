//
//  Consent.m
//  ORKDemo
//
//  Created by lizhao on 15/4/28.
//  Copyright (c) 2015年 lizhao. All rights reserved.
//

#import "Consent.h"
#define _N(x) [NSNumber numberWithInteger:x]

@implementation Consent

+ (ORKConsentDocument *) consentDocument {
    
    ORKConsentDocument *consentDocument = [[ORKConsentDocument alloc] init];
    
    consentDocument.title = NSLocalizedString(@"Example Consent", comment: @"");
    
    consentDocument.signaturePageTitle = NSLocalizedString(@"Consent", comment: @"");
    
    consentDocument.signaturePageContent = NSLocalizedString(@"I agree to participate in this research project.", comment: @"");
    
    NSString *participantSignatureTitle = NSLocalizedString(@"Participant", comment: @"");
    ORKConsentSignature *participantSignature = [ORKConsentSignature signatureForPersonWithTitle:participantSignatureTitle dateFormatString:nil identifier:@"ConsentDocumentParticipantSignature"];
    
    [consentDocument addSignature:participantSignature];
    
    NSArray *consentSectionTypes = [NSArray arrayWithObjects:
                                    _N(ORKConsentSectionTypeOverview),
                                    _N(ORKConsentSectionTypeCustom),
                                    _N(ORKConsentSectionTypeStudySurvey),
                                    _N(ORKConsentSectionTypeDataGathering),
                                    _N(ORKConsentSectionTypePrivacy),
                                    _N(ORKConsentSectionTypeDataUse),
                                    _N(ORKConsentSectionTypeTimeCommitment),
                                    _N(ORKConsentSectionTypeWithdrawing), nil];
    
    NSMutableArray *consentSections = [NSMutableArray array];
    for (NSNumber *type in consentSectionTypes) {
        ORKConsentSection *consentSection = [[ORKConsentSection alloc] initWithType:[type integerValue]];
        if (consentSection.type == ORKConsentSectionTypeOverview) {
            NSString *overview = @"This is a small study to look at the correlation between Quality of Life and walking exercises.";
            consentSection.title = @"SP+EE Demo";
            consentSection.summary = overview;
            consentSection.content = overview;
        }
        
        if (consentSection.type == ORKConsentSectionTypeCustom) {
            
            consentSection.customImage = [UIImage imageNamed:@"walking"];
            NSString *walking = @"This research project will involve doing walking exercises everyday.";
            consentSection.title = @"Walking Exercises";
            consentSection.summary = walking;
            consentSection.content = walking;
        }
        
        if (consentSection.type == ORKConsentSectionTypeStudySurvey) {
            NSString *qol = @"As part of this project you will also need to fill out a Quality of Life questionnaire.";
            consentSection.title = @"Quality of Life";
            consentSection.summary = qol;
            consentSection.content = qol;
        }
        
        if (consentSection.type == ORKConsentSectionTypeDataGathering) {
            NSString *data = @"Data will be gathered everytime you complete a walk or a questionnaire.";
            consentSection.title = @"Data";
            consentSection.summary = data;
            consentSection.content = data;
        }
        
        if (consentSection.type == ORKConsentSectionTypePrivacy) {
            NSString *privacy = @"The data we collect will be securely stored on our servers.";
            consentSection.title = @"Privacy";
            consentSection.summary = privacy;
            consentSection.content = privacy;
        }
        
        if (consentSection.type == ORKConsentSectionTypeDataUse) {
            NSString *dataUse = @"We will then look for correlations between the walking exercises and Quality of Life.";
            consentSection.title = @"Data Use";
            consentSection.summary = dataUse;
            consentSection.content = dataUse;
        }
        
        if (consentSection.type == ORKConsentSectionTypeTimeCommitment) {
            NSString *time = @"Contributing your data to this project will take about 10 minutes a day.";
            consentSection.title = @"Time Commitment";
            consentSection.summary = time;
            consentSection.content = time;
        }
        
        if (consentSection.type == ORKConsentSectionTypeWithdrawing) {
            NSString *withdrawal = @"You can withdraw from the research project at any time.";
            consentSection.title = @"Withdrawing";
            consentSection.summary = withdrawal;
            consentSection.content = withdrawal;
        }
        
        [consentSections addObject:consentSection];
    }
    
    consentDocument.sections = consentSections;
    return consentDocument;
}


+ (ORKOrderedTask *) consentTask {
    
    NSMutableArray *steps = [NSMutableArray array];
    
    ORKConsentDocument *consentDocument = [self consentDocument];
    ORKVisualConsentStep *visualConsentStep = [[ORKVisualConsentStep alloc] initWithIdentifier:@"VisualConsentStep" document:consentDocument];
    [steps addObject:visualConsentStep];
    
    ORKConsentSignature *signature = [consentDocument.signatures firstObject];
    
    ORKConsentReviewStep *reviewConsentStep = [[ORKConsentReviewStep alloc] initWithIdentifier:@"ConsentReviewStep" signature:signature inDocument:consentDocument];
    
    reviewConsentStep.text = @"Review Consent";
    reviewConsentStep.reasonForConsent = @"Consent to join study";
    
    [steps addObject:self];
    return [[ORKOrderedTask alloc] initWithIdentifier:@"ConsentTask" steps:steps];
}

@end
