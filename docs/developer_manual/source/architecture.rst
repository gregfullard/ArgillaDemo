Architecture
============

4+1 Framework
-------------

4+1 is a view model designed by Philippe Kruchten for "describing the architecture of software-intensive systems, 
based on the use of multiple, concurrent views". The views are used to describe the system from the viewpoint of 
different stakeholders, such as end-users, developers and project managers. The four views of the model are 
logical, development, process and physical view. In addition selected use cases or scenarios are used to 
illustrate the architecture serving as the 'plus one' view. 

Hence the model contains 4+1 views.

.. image:: assets/4_plus_1_view_of_sw_architecture.*


**Development view:**

* The development view illustrates a system from a programmer's perspective and is concerned with software management. 
* This view is also known as the implementation view. 
* It uses the UML Component diagram to describe system components. 
* UML Diagrams used to represent the development view include the Package diagram.

**Logical view:**

* The logical view is concerned with the functionality that the system provides to end-users. 
* UML diagrams used to represent the logical view include, class diagrams, and state diagrams.

**Physical view:**

* The physical view depicts the system from a system engineer's point of view. 
* It is concerned with the topology of software components on the physical layer as well as the physical connections between these components. 
* This view is also known as the deployment view. UML diagrams used to represent the physical view include the deployment diagram.

**Process view:**

* The process view deals with the dynamic aspects of the system, explains the system processes and how they communicate, and focuses on the runtime behavior of the system. 
* The process view addresses concurrency, distribution, integrators, performance, and scalability, etc. 
* UML diagrams to represent process view include the activity diagram.

**Scenarios:**

* The description of an architecture is illustrated using a small set of use cases, or scenarios, which become a fifth view. 
* The scenarios describe sequences of interactions between objects and between processes.
* They are used to identify architectural elements and to illustrate and validate the architecture design. 
* They also serve as a starting point for tests of an architecture prototype. 
* This view is also known as the use case view.