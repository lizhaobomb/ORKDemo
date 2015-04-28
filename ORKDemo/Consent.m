//
//  Consent.m
//  ORKDemo
//
//  Created by lizhao on 15/4/28.
//  Copyright (c) 2015年 lizhao. All rights reserved.
//

#import "Consent.h"

@implementation Consent

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    
    consentDocument.title = NSLocalizedString("Example Consent", comment: "")
    
    consentDocument.signaturePageTitle = NSLocalizedString("Consent", comment: "")
    
    consentDocument.signaturePageContent = NSLocalizedString("I agree to participate in this research project.", comment: "")
    
    let participantSignatureTitle = NSLocalizedString("Participant", comment: "")
    let participantSignature = ORKConsentSignature(forPersonWithTitle: participantSignatureTitle, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
    
    consentDocument.addSignature(participantSignature)
    
    let consentSectionTypes: [ORKConsentSectionType] = [
                                                        .Overview,
                                                        .Custom,
                                                        .StudySurvey,
                                                        .DataGathering,
                                                        .Privacy,
                                                        .DataUse,
                                                        .TimeCommitment,
                                                        .Withdrawing
                                                        ]
    
    var consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        
        //Overview Consent Section
        
        if consentSection.type == .Overview {
            let overview = "This is a small study to look at the correlation between Quality of Life and walking exercises."
            consentSection.title = "SP+EE Demo"
            consentSection.summary = overview
            consentSection.content = overview
        }
        
        if consentSection.type == .Custom {
            
            consentSection.customImage = UIImage(named: "walking.png")
            let walking = "This research project will involve doing walking exercises everyday."
            consentSection.title = "Walking Exercises"
            consentSection.summary = walking
            consentSection.content = walking
        }
        
        if consentSection.type == .StudySurvey {
            let qol = "As part of this project you will also need to fill out a Quality of Life questionnaire."
            consentSection.title = "Quality of Life"
            consentSection.summary = qol
            consentSection.content = qol
        }
        
        if consentSection.type == .DataGathering {
            let data = "Data will be gathered everytime you complete a walk or a questionnaire."
            consentSection.title = "Data"
            consentSection.summary = data
            consentSection.content = data
        }
        
        if consentSection.type == .Privacy {
            let privacy = "The data we collect will be securely stored on our servers."
            consentSection.title = "Privacy"
            consentSection.summary = privacy
            consentSection.content = privacy
        }
        
        if consentSection.type == .DataUse {
            let dataUse = "We will then look for correlations between the walking exercises and Quality of Life."
            consentSection.title = "Data Use"
            consentSection.summary = dataUse
            consentSection.content = dataUse
        }
        
        if consentSection.type == .TimeCommitment {
            let time = "Contributing your data to this project will take about 10 minutes a day."
            consentSection.title = "Time Commitment"
            consentSection.summary = time
            consentSection.content = time
        }
        
        if consentSection.type == .Withdrawing {
            let withdrawal = "You can withdraw from the research project at any time."
            consentSection.title = "Withdrawing"
            consentSection.summary = withdrawal
            consentSection.content = withdrawal
        }
        
        return consentSection
    }
    
    consentDocument.sections = consentSections
    
    return consentDocument
}

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    var consentDocument = ConsentDocument
    
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    
    steps += [visualConsentStep]
    
    let signature = consentDocument.signatures!.first as! ORKConsentSignature
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
    
    reviewConsentStep.text = "Review Consent"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}

@end
