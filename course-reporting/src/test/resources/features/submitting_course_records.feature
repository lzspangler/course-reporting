Feature: Submitting course records 

- As a student
- I need to be able to run progress reports on courses that I am in
- In order to record my progress in the course


Background: 

Given the existing course "OCP1"
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

And I have worked on these lab sections:
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment        | Timestamp                 |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             | "a good class" | 2017-06-23T16:07:07+00:00 |
| 1      | 1          | HA Environment        | Setup Lab Environment         | true              | "its crap"     | 2017-06-23T16:07:07+00:00 |

When I run the course progress report

Then the following report is created for student "hhippo" and course "OCP1":
| Lab Id | Section Id | Lab Name              | Section Name                  | Section Completed | Comment | Timestamp |
| 1      | 1          | Provision Environment | Setup Lab Environment         | false             |         |           |
| 1      | 2          | Provision Environment | Share Public Key              | false             |         |           |
| 1      | 3          | Provision Environment | Test Server                   | false             |         |           |
| 2      | 1          | HA Environment        | Setup Lab Environment         | false             |         |           |
| 2      | 2          | HA Environment        | Configure RHEL 7.3            | false             |         |           |
| 2      | 3          | HA Environment        | Deploy HSOSE Cluster          | false             |         |           |
| 3      | 1          | Networking            | Configure Multitenant Network | false             |         |           |
| 3      | 2          | Networking            | Add Content to Projects       | false             |         |           |



#=================================================================
Scenario: 2.




#=================================================================