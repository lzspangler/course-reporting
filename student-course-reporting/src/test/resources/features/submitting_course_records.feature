Feature: Submitting course records 

- As a student
- I need to be able to run progress reports on courses that I am in
- In order to record my progress in the course

Notes:
- The guideline for updating student course records is that the 'best latest' result should be recorded
    - i.e. a recorded 'successful' section completion should not be updated to 'unsuccessful'
    
 - Comments should be appended, with a * or | or somethign before each newly added comment
     - appends comments rather than overwriting

- If version not specified then get latest?

input submitted:
--> course name
--> course version
--> lab/sections evaluated
   --> within sections:
   		 - result
         - comment
         - timestamp



course name:
course version:

lab name:
	section name:
		result:
		comment:
		timestamp:

lab name:
	section name:
		result:
		comment:
		timestamp:

...
	


#=================================================================
Background: 

Given the existing course "OCP1" version "1.0":
| Lab Id | Section Id | Lab Name              | Section Name                  |
| 1      | 1          | Provision Environment | Setup Lab Environment         |
| 1      | 2          | Provision Environment | Share Public Key              |
| 1      | 3          | Provision Environment | Test Server                   |
| 2      | 1          | HA Environment        | Setup Lab Environment         |
| 2      | 2          | HA Environment        | Configure RHEL 7.3            |
| 2      | 3          | HA Environment        | Deploy HSOSE Cluster          |
| 3      | 1          | Networking            | Configure Multitenant Network |
| 3      | 2          | Networking            | Add Content to Projects       |


#=================================================================
Scenario: 1. Submitting course progress for the first time

Given I am student "hhippo"

And I have not previously started the course "OCP1"

And I have just worked these lab sections:
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             | "a good section" | 2017-06-23T16:07:07+00:00 |
| 2      | 2          | HA Environment        | Configure RHEL 7.3            | true              |                  | 2017-06-23T16:07:07+00:00 |
| 2      | 3          | HA Environment        | Deploy HSOSE Cluster          | true              | "its crap"       | 2017-06-23T16:07:07+00:00 |
| 3      | 1          | Networking            | Configure Multitenant Network | false             |                  | 2017-06-23T16:07:07+00:00 |

When I run the course progress report

Then the following report is created for student "hhippo" and course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             | "a good section" | 2017-06-23T16:07:07+00:00 |
| 1      | 2          | Provision Environment | Share Public Key              | null              |                  |                           |
| 1      | 3          | Provision Environment | Test Server                   | null              |                  |                           |
| 2      | 1          | HA Environment        | Setup Lab Environment         | null              |                  |                           |
| 2      | 2          | HA Environment        | Configure RHEL 7.3            | true              |                  | 2017-06-23T16:07:07+00:00 |
| 2      | 3          | HA Environment        | Deploy HSOSE Cluster          | true              | "its crap"       | 2017-06-23T16:07:07+00:00 |
| 3      | 1          | Networking            | Configure Multitenant Network | false             |                  | 2017-06-23T16:07:07+00:00 |
| 3      | 2          | Networking            | Add Content to Projects       | null              |                  |                           |


#=================================================================
Scenario: 2. Continuing work on a lab - Update unsuccessful section completion if newer attempt is successful

Given I am student "hhippo"

And I have previously reported on these sections of course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             | "a good section" | 2017-06-20T08:07:05+00:00 |

And I have just worked these lab sections:
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment        | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | true              |                | 2017-06-23T16:07:07+00:00 |

When I run the course progress report

Then the following report is created for student "hhippo" and course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | true              | "a good section" | 2017-06-23T16:07:07+00:00 |
| 1      | 2          | Provision Environment | Share Public Key              | false             |                  |                           |
| 1      | 3          | Provision Environment | Test Server                   | false             |                  |                           |
| 2      | 1          | HA Environment        | Setup Lab Environment         | false             |                  |                           |
| 2      | 2          | HA Environment        | Configure RHEL 7.3            | false             |                  |                           |
| 2      | 3          | HA Environment        | Deploy HSOSE Cluster          | false             |                  |                           |
| 3      | 1          | Networking            | Configure Multitenant Network | false             |                  |                           |
| 3      | 2          | Networking            | Add Content to Projects       | false             |                  |                           |


#=================================================================
Scenario: 3. Continuing work on a lab - Update unsuccessful section completion even if newer attempt is also unsuccessful

Given I am student "hhippo"

And I have previously reported on these sections of course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 | Number of Attempts |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             | "a good section" | 2017-06-20T08:07:05+00:00 | 1                  |

And I have just worked these lab sections:
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment        | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             | "not so good"  | 2017-06-23T16:07:07+00:00 |

When I run the course progress report

Then the following report is created for student "hhippo" and course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment                        | Timestamp                 | Number of Attempts |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             | "a good section * not so good" | 2017-06-23T16:07:07+00:00 | 2                  |
| 1      | 2          | Provision Environment | Share Public Key              | false             |                                |                           |                    |
| 1      | 3          | Provision Environment | Test Server                   | false             |                                |                           |                    |
| 2      | 1          | HA Environment        | Setup Lab Environment         | false             |                                |                           |                    |
| 2      | 2          | HA Environment        | Configure RHEL 7.3            | false             |                                |                           |                    |
| 2      | 3          | HA Environment        | Deploy HSOSE Cluster          | false             |                                |                           |
| 3      | 1          | Networking            | Configure Multitenant Network | false             |                  |                           |
| 3      | 2          | Networking            | Add Content to Projects       | false             |                  |                           |


#=================================================================
Scenario: 4. Continuing work on a lab - Update successful section completion even if newer attempt is also successful

Given I am student "hhippo"

And I have previously reported on these sections of course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | true              | "a good section" | 2017-06-20T08:07:05+00:00 |

And I have just worked these lab sections:
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment        | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | true              |                | 2017-06-23T16:07:07+00:00 |

When I run the course progress report

Then the following report is created for student "hhippo" and course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | true              |                  | 2017-06-23T16:07:07+00:00 |
| 1      | 2          | Provision Environment | Share Public Key              | false             |                  |                           |
| 1      | 3          | Provision Environment | Test Server                   | false             |                  |                           |
| 2      | 1          | HA Environment        | Setup Lab Environment         | false             |                  |                           |
| 2      | 2          | HA Environment        | Configure RHEL 7.3            | false             |                  |                           |
| 2      | 3          | HA Environment        | Deploy HSOSE Cluster          | false             |                  |                           |
| 3      | 1          | Networking            | Configure Multitenant Network | false             |                  |                           |
| 3      | 2          | Networking            | Add Content to Projects       | false             |                  |                           |


#=================================================================
Scenario: 5. Continuing work on a lab - Do not overwrite successful section completion with unsuccessful 

Given I am student "hhippo"

And I have previously reported on these sections of course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | true              | "a good section" | 2017-06-20T08:07:05+00:00 |

And I have just worked these lab sections:
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment        | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             | "it was ok"    | 2017-06-23T16:07:07+00:00 |

When I run the course progress report

Then the following report is created for student "hhippo" and course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment          | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | true              | "a good section * it was ok" | 2017-06-20T08:07:05+00:00 |
| 1      | 2          | Provision Environment | Share Public Key              | false             |                  |                           |
| 1      | 3          | Provision Environment | Test Server                   | false             |                  |                           |
| 2      | 1          | HA Environment        | Setup Lab Environment         | false             |                  |                           |
| 2      | 2          | HA Environment        | Configure RHEL 7.3            | false             |                  |                           |
| 2      | 3          | HA Environment        | Deploy HSOSE Cluster          | false             |                  |                           |
| 3      | 1          | Networking            | Configure Multitenant Network | false             |                  |                           |
| 3      | 2          | Networking            | Add Content to Projects       | false             |                  |                           |


#=================================================================
Scenario: 6. Exception case: attempting to submit course progress for a course that does not exist


