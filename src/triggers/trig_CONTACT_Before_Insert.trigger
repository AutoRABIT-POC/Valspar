trigger trig_CONTACT_Before_Insert on Contact (before insert) {

    blogic_ContactActions.PopulateLastNameOnUnknown(Trigger.New);

    blogic_ContactActions.CreateConsumerAccount(Trigger.New);


}