# AWS Well-Architected Framework

https://d1.awsstatic.com/whitepapers/architecture/AWS_Well-Architected_Framework.pdf

# Introduction

The AWS Well-Architected Framework helps you understand the pros and cons of decisions you make while building systems on AWS. By using the Framework you will learn architectural best practices for designing and operating reliable, secure, efficient, and cost-effective systems in the cloud. It provides a way for you to consistently measure your architectures aginst best practices and identify areas for improvement. The process for reiewing an architecture is a constructive converasation about architectural decisions, and is not an audit mechanism. We believe that having well-architected systems greatly increases the likelihood of business success.

AWS Solutions Architects have years of experience architecting solutions across a wide variety of business verticals and use cases. We have helped design and review thousands of customers' architectures on AWS. From this experience, we have identified best practices and core strategies for architecting systems in the cloud.

The AWS well-Architected Framework documents a set of foundational questions that allow you to understand if a specific architecture aligns well with cloud best practices. The framework provides a consistent approach to evaluating systems aginst the qualities you expect from modern cloud-based systems, and the remediation that would be required to achieve those qualities. As AWS continues to evolve, and we continue to learn more from working with our customers, we will continue to refine the definition of well-architectd.

This framework is intended for those in technology roles, such as chief technology officers(CTOs), architects, developers, and operations team members. It describes AWS best practices and strategies to use when desgning and operating a cloud workload, and provides links to further implementation details and architectural patterns. For more inforamtion, see the [AWS Well-Architected homepage](https://aws.amazon.com/architecture/well-architected/?ref=wellarchitected-wp).

AWS also provides a service for reviewing your workloads at no charge. The [AWS Well-Architected Tool](https://aws.amazon.com/well-architected-tool/?ref=wellarchitected-wp) (AWS WA Tool) is a service in the cloud that provides a consistent process for you to review and measure your architecture using the AWS Well-Architected Framework. The AWS WA Tool provides recommendations for making your workloads more reliable, secure, efficient, and cost-effective.

To help you apply best practices, we have created [AWS Well-Architected Labs](https://wellarchitectedlabs.com/?ref=wellarchitected-wp), which provides you with a repository of code and documentation to give you hands-on experience implementing best practices. We also have teamd up with select AWS Partner Network (APN) Partners, who are members of the [AWS Well-Architected Partner program](https://aws.amazon.com/architecture/well-architected/partners/?ref=wellarchitected-wp). These APN Partners have deep AWS knowledge, and can help you review and improve your workloads.

## Definitions

Every day experts at AWS assist customers in architecting systems to take advantage of best proctices in the cloud. We work with you on making architectural trade-offs as your designs evolve. As you deploy these systems into live environments, we learn how well these systems perform and the consequences of those trade-offs.

Based on what we have learned we have created the AWS Well-Architected Framework, which provides a consistent set of best practices for customers and partners to evaluate architectures, and provides a set of questions you can use to evaluate how well an architecture is aligned to AWS best practices.

The AWS Well-Architectd Framework is based on five piilars -- operational excellence, secuirty, reliability, performance efficiency, and cost optimaization.

**Table 1. The pillars of the AWS Well-Architected Framework**

| Name                   | Description                                                                                                                                                                                                            |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Operational Excellence | The ability to run and monitor systems to deliver business value and to continually improve supporting processes and procedures.                                                                                       |
| Security               | The ability to protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies.                                                                            |
| Reliability            | The ability of a system to recover from infrastructure or service disruptions, dynamically acquire computing resources to meet demand, and mitigate disruptions such as misconfigurations or transient network issues. |
| Performance Efficiency | The ability to use computing resources efficiently to meet system requirements, and to maintain that efficiency as demand changes and technologies evolve.                                                             |
| Cost Optimization      | The ability to run systems to deliver business value at the lowest price point.                                                                                                                                        |

In the AWS Well-Architected Framework we use these terms

- A **component** is the code, configuration and AWS Resources that together deliver against a requirement. A component is often the unit of technical ownership, and is decoupled from other components.

- We use the term **workload** to identify a set of components that together deliver business value. The workload is usually the level of detail that business and technology leaders communicate about.

- **Milestones** mark key changes in your architecture as it evolves throughout the product lifecycle (design, testing, go live, and in production).

- We think about **architecture** as being how components work together in a workload. How components communicate and interact is often the focus of architecture diagrams.

- Within an organization the **technology portfolio** is the collection of workloads that are required for the business to operate.

When architecting workloads you make trade-offs between pillars based upon your business context. These business decisions can drive your engineering priorities.
You might optimize to reduce cost at the expense of reliability in development environments, or, for mission-critical solutions, you might optimize reliability with increased costs. In ecommerce solutions, performance can affect revenue and customer propensity to buy. Security and operational excellence are generally not traded-off aginst the other pillars.

## On Architecture

In on-premises environments customers often have a central team for technology architecture that acts as an overlay to other product or feature teams to ensure they are following best practice. Technology architecture teams are often composed of a set of roles such as Technical Architect (infrastructure), Solutions Architect (software), Data Architect, Networking Architect, and Security Architect. Often these teams use [TOGAF](http://pubs.opengroup.org/architecture/togaf9-doc/arch/?ref=wellarchitected-wp) or the [Zachman Framework](https://www.zachman.com/about-the-zachman-framework?ref=wellarchitected-wp) as part of an enterprise architecture capability.

At AWS, we prefer to distribute capabilities into teams rather than haveing a centralized team with that capability. There are risks when you choose to distribute desision making authority, for example, ensuring that teams are meeting internal standards. We mitigate these risks in two way. First, we have practices that forcus on enabling each team to have that capability, and we put in place experts who ensure that teams raise the bar on the standards theyneed to meet. Second, we implement mechanisms that carry out automated checks to ensure standards are being met. This distributed approach is supported by the [Amazon leadership principles](https://www.amazon.com/p/feature/p34qgjcv93n37yd?ref=wellarchitected-wp), and establishes a culture across all roles that works back from the customer. Customer-obsessed teams build products in response to a customer need.

For architecture this means that we expect every team to have the capability to create architectures and to follow best practices. To help new teams gain these capabilities or existing teams to raise their bar, we enable access to a virtual community of principal engineers who can review their degigns and help them understand what AWS best ractices are. The principal engineering community works to make best practices visible and accessible. One way they do this, for example, is through lunchtime talks that focus on applying best practices to real examples. These talk are recorded and can be used as part of onboarding materails for new team members.

AWS best practices emerge from our experience running thousands of systems at internet scale. We prefer to use data to define best practice, but we also use subject matter experts like principal engineers to set them. As principal engineers see new best practices emerge they work as a community to ensure that teams follow them. In time, these best practices are formalized into our internal review processes, as well as into mechanisms that enforce compliance. Well-Architected is the customer-facing implementation of our internal review process, where we have codified our principal engineering thinking across field roles like Solutions Architecture and internal engineering teams Well-Architected is a scalable mechanism that lets you take advantage of these learnings.

By following the approach of a principal engineering community with distributed ownership of architecture, we believe that a Well-Architected enterprise architecture can emerge that is driven by customer need. Technology leaders (such as a CTOs or development managers), carrying out Well-Architected reviews across all your workloads will allow you to better understand the risks in your technology portfolio. Using this approach you can identify themes across teams that your organization could address by mechanisms, trainings, or lunchtime talks where your principal engineers can share their thinking on specific areas with multiple teams.

## General Design Principles

The Well-Architected Framework identifies a set of general design principles to facilitate good design in the cloud:

- **stop guessing your capacity needs**: Eliminate guessing about your infrastructure capacity needs. When you make a capacity decision before you deploy a system, you might end up sitting on expensive idle resources or dealing with the performance implications of limited capacity. With cloud computing, these problems can go away. You can use as much or as little capacity as you need, and scale up and down automatically.
- **Test systems at production scale**: In the cloud, you can create a production-scale test environment on demand, complete your testing, and then decommission the resources. Because you only pay for the test environment when it's running, you can simulate your live environment for a fraction of the cost of testing on premises.
- **Automate to make architectural experimentation easier**: Automation allows you to create and replicate your systems at low cost and avoid the expense of manual effort. You can track changes to your automation, audit the impact, and revert to previous parameters when necessary.
- **Allow for evolutionary architectures**: Allow for evolutionary architectures. In a traditional environment, architectural decisions are often implemented as static, one-time events, with a few major versions of a system during its lifetime. As a business and its context continue to change, these initial decisions might hinder the system's ability to deliver changing business requirements. In the cloud, the capability to automate and test on demand lowers the risk of impact from design changes. This allows systems to evolve over time so that businesses can take advantage of innovations as a standard practice.
- **Drive architetures using data**: In the cloud you can collect data on how your architectural choices affect the behavior of your workload. This lets you make fact-based decisions on how to improve your workload. Your cloud infrastructure is code, so you can use that data to inform your architecture choices and improvemnets over time.
- **Improve through game days**: Test how your architecture and processes perform by regularly scheduling game days to simulate events in production. This will help you understand where improvements can be made and can help develop organizational experience in dealing with events.
