trigger OpportunityRollupToAccount on Opportunity (after insert,after Update, after delete) {
	system.debug('---opportunity trigger----');
    // Update Number of opportunity field where sale type = project and stage = closed won
   	 // Trigger after isinsert - When Opportunity Created 
		//Check Condition of Transaction Partner != Null,sale type = project and stage = closed won 
	// Trigger after Update 
		 
}