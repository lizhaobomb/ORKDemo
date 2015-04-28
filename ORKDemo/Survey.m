//
//  Survey.m
//  ORKDemo
//
//  Created by lizhao on 15/4/28.
//  Copyright (c) 2015年 lizhao. All rights reserved.
//

#import "Survey.h"

@implementation Survey
+(ORKOrderedTask *) surveyTask {
    NSMutableArray *steps = [NSMutableArray array];
    
    ORKInstructionStep *instructionStep = [[ORKInstructionStep alloc] initWithIdentifier:@"instructionStep"];
    instructionStep.title = NSLocalizedString(@"Quality Of Life Questionnaire", comment: @"");
    instructionStep.text = @"You will need to answer 13 questions about your quality of life";
    [steps addObject:instructionStep];
    
    //Question 1
    
    NSString *textChoiceOneText = NSLocalizedString(@"Poor", comment: @"");
    NSString *textChoiceTwoText = NSLocalizedString(@"Fair", comment: @"");
    NSString *textChoiceThreeText = NSLocalizedString(@"Good", comment:@"");
    NSString *textChoiceFourText = NSLocalizedString(@"Excellent", comment:@"");
    
    ORKTextChoice *ch1 = [ORKTextChoice choiceWithText:textChoiceOneText value:@"choice_1"];
    ORKTextChoice *ch2 = [ORKTextChoice choiceWithText:textChoiceTwoText value:@"choice_2"];
    ORKTextChoice *ch3 = [ORKTextChoice choiceWithText:textChoiceThreeText value:@"choice_3"];
    ORKTextChoice *ch4 = [ORKTextChoice choiceWithText:textChoiceFourText value:@"choice_4"];
    
    
    NSArray *textChoices = [NSArray arrayWithObjects:ch1,ch2,ch3,ch4, nil];
    
    ORKAnswerFormat *answerFormat = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:textChoices];
    ORKQuestionStep *question1Step = [ORKQuestionStep questionStepWithIdentifier:@"Question1Step" title:@"Physical Health" answer:answerFormat];
    
    question1Step.text = @"First of all, how do you feel about your physical health?";
    
    //The optional attribute will remove the ability to skip the question
    question1Step.optional = NO;
    
    [steps addObject:question1Step];
    
    //Question 2
    ORKQuestionStep *question2Step = [ORKQuestionStep questionStepWithIdentifier:@"Question2Step" title:@"Energy Levels" answer:answerFormat];
    
    question2Step.text = @"How do you feel about your energy level?";
    
    [steps addObject:question2Step];
    
    //Question 3
    ORKQuestionStep *question3Step = [ORKQuestionStep questionStepWithIdentifier:@"Question3Step" title:@"Mood" answer:answerFormat];
    
    question3Step.text = @"How has your mood been lately? Have your spirits been good, or have you been feeling down?";
    
    [steps addObject:question3Step];
    
    // Question 4
    
    ORKQuestionStep *question4Step = [ORKQuestionStep questionStepWithIdentifier:@"Question4Step" title:@"Living Situation" answer:answerFormat];
    
    question4Step.text = @"How about your living situation? How do you feel about the place you live now?";
    
    [steps addObject:question4Step];
    
    
    // Question 5
    
    ORKQuestionStep *question5Step = [ORKQuestionStep questionStepWithIdentifier:@"Question5Step" title:@"Memory" answer:answerFormat];
    
    question5Step.text = @"How about your memory?";
    
    [steps addObject:question5Step];
    
    // Question 6
    
    ORKQuestionStep *question6Step = [ORKQuestionStep questionStepWithIdentifier:@"Question6Step" title:@"Family" answer:answerFormat];
    
    question6Step.text = @"How about your family and your relationship with family members? Would you describe it as poor, fair, good, or excellent?";
    
    [steps addObject:question6Step];
    // Question 7
    
    ORKQuestionStep *question7Step = [ORKQuestionStep questionStepWithIdentifier:@"Question7Step" title:@"Marriage" answer:answerFormat];
    
    question7Step.text = @"How do you feel about your marriage?";
    
    [steps addObject:question7Step];
    // Question 8
    
    ORKQuestionStep *question8Step = [ORKQuestionStep questionStepWithIdentifier:@"Question8Step" title:@"Friends" answer:answerFormat];
    
    question8Step.text = @"How would you describe your current relationship with your friends?";
    
    [steps addObject:question8Step];
    // Question 9
    
    ORKQuestionStep *question9Step = [ORKQuestionStep questionStepWithIdentifier:@"Question9Step" title:@"Your Self" answer:answerFormat];
    
    question9Step.text = @"How do you feel about yourself—when you think of your whole self, and all the different things about you?";
    
    [steps addObject:question9Step];
    // Question 10
    
    ORKQuestionStep *question10Step = [ORKQuestionStep questionStepWithIdentifier:@"Question10Step" title:@"House Work" answer:answerFormat];
    
    question10Step.text = @"How do you feel about your ability to do things like chores around the house or other things you need to do?";
    
    [steps addObject:question10Step];
    // Question 11
    
    ORKQuestionStep* question11Step = [ORKQuestionStep questionStepWithIdentifier:@"Question11Step" title:@"Enjoyment" answer:answerFormat];
    
    question11Step.text = @"How about your ability to do things for fun, that you enjoy?";
    [steps addObject:question11Step];
    
    // Question 12
    
    ORKQuestionStep* question12Step = [ORKQuestionStep questionStepWithIdentifier:@"Question12Step" title:@"Money" answer:answerFormat];
    
    question12Step.text = @"How do you feel about your current situation with money, your financial situation?";
    [steps addObject:question12Step];
    
    // Question 13
    
    ORKQuestionStep *question13Step = [ORKQuestionStep questionStepWithIdentifier:@"Question13Step" title:@"Life" answer:answerFormat];

    question13Step.text = @" How would you describe your life as a whole. When you think about your life as a whole, everything together, how do you feel about your life?";
    [steps addObject:question13Step];
    
    // Add a summary step.
    ORKInstructionStep *summaryStep = [[ORKInstructionStep alloc] initWithIdentifier:@"SummaryStep"];
    summaryStep.title = NSLocalizedString(@"Thanks", comment: @"");
    summaryStep.text = NSLocalizedString(@"Thank you for completing your quality of life questionnaire.", comment: @"");
    
    [steps addObject:summaryStep];
    
    return [[ORKOrderedTask alloc] initWithIdentifier:@"SurveyStep" steps:steps];
}
@end
