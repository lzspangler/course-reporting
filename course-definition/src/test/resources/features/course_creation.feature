Feature: Defining a new course  --- Added version to course

- As an instructor
- I need to be able to define new courses
- In order to collect information about student course completion


#=================================================================
Scenario: 1. Creating a new course

Given the following course definition with the name "OCP1" and version "1.0":
| Lab Name              | Section Name                  |
| Provision Environment | Setup Lab Environment         |
| Provision Environment | Share Public Key              |
| Provision Environment | Test Server                   |
| HA Environment        | Setup Lab Environment         |
| HA Environment        | Configure RHEL 7.3            |
| HA Environment        | Deploy HSOSE Cluster          |
| Networking            | Configure Multitenant Network |
| Networking            | Add Content to Projects       |

When I submit the course definition

Then the following course is created with the name "OCP1" and version "1.0":
| Lab Name              | Section Name                  |
| Provision Environment | Setup Lab Environment         |
| Provision Environment | Share Public Key              |
| Provision Environment | Test Server                   |
| HA Environment        | Setup Lab Environment         |
| HA Environment        | Configure RHEL 7.3            |
| HA Environment        | Deploy HSOSE Cluster          |
| Networking            | Configure Multitenant Network |
| Networking            | Add Content to Projects       |


#=================================================================
Scenario: 2. Attempting to create a course with the same name as an existing course

Given the existing course "OCP1" version "1.0":
| Lab Name              | Section Name                  |
| Provision Environment | Setup Lab Environment         |
| Networking            | Configure Multitenant Network |
| Networking            | Add Content to Projects       |

And the following course definition with the name "OCP1" version "1.0":
| Lab Name              | Section Name                  |
| Provision Environment | Setup Lab Environment         |
| Provision Environment | Share Public Key              |
| Provision Environment | Test Server                   |
| HA Environment        | Setup Lab Environment         |
| HA Environment        | Configure RHEL 7.3            |
| HA Environment        | Deploy HSOSE Cluster          |
| Networking            | Configure Multitenant Network |
| Networking            | Add Content to Projects       |

When I submit the course definition

Then the following course is updated with the name "OCP1" and version "1.0":
| Lab Name              | Section Name                  |
| Provision Environment | Setup Lab Environment         |
| Provision Environment | Share Public Key              |
| Provision Environment | Test Server                   |
| HA Environment        | Setup Lab Environment         |
| HA Environment        | Configure RHEL 7.3            |
| HA Environment        | Deploy HSOSE Cluster          |
| Networking            | Configure Multitenant Network |
| Networking            | Add Content to Projects       |



