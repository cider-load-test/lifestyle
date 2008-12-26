lifestyle tracking
------------------

This is a merb application for tracking one's consumption and waste, build on merb. It's not a terribly complex application and is nowhere near complete.

The idea is that you can keep a record of consumption by adding "items" to "reports". Not great names, but I don't know what else to call them. Reports are by-day and are summarized for the user by-week.

Items might be like "drive to store" which has a _usage_ of 10 (miles) and _impact_ of 0.5 (gallons). This can be automatically calculated if the user creates a "metric" (again, not great names) called "car" (maybe more specific if they have multiple cars) with _usage unit_ "miles", _impact unit_ "gallons", and _ratio_ 0.05 (20 miles per gallon, which is actually 0.05 gallons per mile).