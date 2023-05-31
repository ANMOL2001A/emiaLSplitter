/*
 * Sample Code for Account Trigger
 */
trigger triggerOnContact on Contact (before insert) {
    TriggerFactory.initiateHandler(Contact.sObjectType);
}