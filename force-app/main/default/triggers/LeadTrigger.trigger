trigger LeadTrigger on Lead(before insert, before update) {
  LeadController.UpdateCountryFields(Trigger.new);

}
