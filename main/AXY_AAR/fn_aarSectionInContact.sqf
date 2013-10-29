/*

Called whenever a contact's been initiated, or we're already in contact.
Just updates the array...

We want to know the time when we last had contact, so we know when to end it.

*/

// TODO - Should it check if it's been too long?

// If we weren't in contact already...
if (!(axyaar_sectionInContact select 0)) then
{
  // Then we sure are now...
  axyaar_sectionInContact set [0, true];
  axyaar_sectionInContact set [1, time];
  // Record it.
  "AXY_AAR_Extension" callExtension format ["save:[%1,'InContact']", time];
};
// Either way update last contact time...
axyaar_sectionInContact set [2, time];

true